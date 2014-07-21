//
//  DPTransparentEdgesTableView.h
//  Couriers
//
//  Created by Denis Prokopchuk on 14.02.14.
//  Copyright (c) 2014 Denis Prokopchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPTransparentEdgesTableView : UITableView <UITableViewDelegate> {
    BOOL showTopMask, showBottomMask;
}

@property (nonatomic, assign) BOOL bottomMaskDisabled, topMaskDisabled;
@property (nonatomic, assign) CGFloat gradientLengthFactor;

@end
