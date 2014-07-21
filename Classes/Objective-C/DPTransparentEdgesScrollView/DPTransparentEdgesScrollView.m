//
//  DPTransparentEdgesScrollView.m
//  Couriers
//
//  Created by Denis Prokopchuk on 13.02.14.
//  Copyright (c) 2014 Denis Prokopchuk. All rights reserved.
//

#import "DPTransparentEdgesScrollView.h"

@implementation DPTransparentEdgesScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initGradient];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initGradient];
    }
    return self;
}

- (void)initGradient {
    self.gradientLengthFactor = 0.1;
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self refresh];
}

- (void)refresh {
    CGFloat offsetY = self.contentOffset.y;
    if (offsetY > 0) {
        if (!showTopMask) {
            showTopMask = YES;
        }
    } else {
        showTopMask = NO;
    }
    
    float bottomEdge = self.contentOffset.y + self.frame.size.height;
    if (bottomEdge >= self.contentSize.height) {
        showBottomMask = NO;
    } else {
        if (!showBottomMask) {
            showBottomMask = YES;
        }
    }
    
    [self refreshGradient];
}

- (void)refreshGradient {
    //creating our gradient mask
    CAGradientLayer *maskLayer = [CAGradientLayer layer];
    
    //this is the anchor point for our gradient, in our case top left. setting it in the middle (.5, .5) will produce a radial gradient. our startPoint and endPoints are based off the anchorPoint
    maskLayer.anchorPoint = CGPointZero;
    
    //The line between these two points is the line our gradient uses as a guide
    //starts in bottom left
    maskLayer.startPoint = CGPointMake(0.0f, 0.0f);
    //ends in top right
    maskLayer.endPoint = CGPointMake(0.0f, 1.0f);
    
    //setting our colors - since this is a mask the color itself is irrelevant - all that matters is the alpha. A clear color will completely hide the layer we're masking, an alpha of 1.0 will completely show the masked view.
    UIColor *outerColor = [UIColor colorWithWhite:1.0 alpha:0.0];
    UIColor *innerColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    
    //an array of colors that dictatates the gradient(s)
    if (!showTopMask && !showBottomMask) {
        maskLayer.colors = @[(id)innerColor.CGColor, (id)innerColor.CGColor, (id)innerColor.CGColor, (id)innerColor.CGColor];
    } else if (showTopMask && !showBottomMask) {
        maskLayer.colors = @[(id)outerColor.CGColor, (id)innerColor.CGColor, (id)innerColor.CGColor, (id)innerColor.CGColor];
    } else if (!showTopMask && showBottomMask) {
        maskLayer.colors = @[(id)innerColor.CGColor, (id)innerColor.CGColor, (id)innerColor.CGColor, (id)outerColor.CGColor];
    } else if (showTopMask && showBottomMask) {
        maskLayer.colors = @[(id)outerColor.CGColor, (id)innerColor.CGColor, (id)innerColor.CGColor, (id)outerColor.CGColor];
    }
    
    //these are percentage points along the line defined by our startPoint and endPoint and correspond to our colors array. The gradient will shift between the colors between these percentage points.
    // Defining the location of each gradient stop. Top gradient runs from 0 to gradientLengthFactor, bottom gradient from 1 - gradientLengthFactor to 1.0
    if (self.bottomMaskDisabled) {
        maskLayer.locations = @[@0.0, [NSNumber numberWithFloat:self.gradientLengthFactor]];
    } else if (self.topMaskDisabled) {
        maskLayer.locations = @[@0.0, [NSNumber numberWithFloat:0], [NSNumber numberWithFloat:1 - self.gradientLengthFactor], @1.0f];
    }
    else {
        maskLayer.locations = @[@0.0, [NSNumber numberWithFloat:self.gradientLengthFactor], [NSNumber numberWithFloat:1 - self.gradientLengthFactor], @1.0f];
    }
    
    maskLayer.frame = self.bounds;
    
    self.layer.mask = maskLayer;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self refresh];
}

@end