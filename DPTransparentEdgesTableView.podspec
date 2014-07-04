Pod::Spec.new do |s|
  s.name         = "DPTransparentEdgesTableView"
  s.version      = "0.1.0"
  s.summary      = "Table and scroll view with transparent top and bottom edges. Written in Swift"
  s.homepage     = "https://github.com/denisprokopchuk/DPTransparentEdgesTableView-Swift"
  s.screenshots  = "https://raw.githubusercontent.com/denisprokopchuk/DPTransparentEdgesTableView-Swift/master/Screenshot.png"

  s.license      = "MIT"
  s.authors             = { "Denis Prokopchuk" => "prokopchuk.denis@gmail.com" }
  s.social_media_url   = "https://www.facebook.com/dprokopchuk"
  s.platform     = :ios
  s.ios.deployment_target = "6.0"
  s.source       = { :git => "https://github.com/denisprokopchuk/DPTransparentEdgesTableView-Swift.git", :tag => "0.1.0" }
  s.source_files  = "Classes/*"
  s.framework  = "QuartzCore"
  s.requires_arc = true
end
