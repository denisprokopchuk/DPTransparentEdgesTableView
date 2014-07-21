Pod::Spec.new do |s|
  s.name         = "DPTransparentEdgesTableView"
  s.version      = "0.1.1"
  s.summary      = "Table and scroll view with transparent top and bottom edges. Written in Swift"
  s.homepage     = "https://github.com/denisprokopchuk/DPTransparentEdgesTableView"
  s.screenshots  = "https://raw.githubusercontent.com/denisprokopchuk/DPTransparentEdgesTableView/master/Screenshot.png"

  s.license      = "MIT"
  s.authors             = { "Denis Prokopchuk" => "prokopchuk.denis@gmail.com" }
  s.social_media_url   = "https://www.facebook.com/dprokopchuk"
  s.platform     = :ios
  s.ios.deployment_target = "6.0"
  s.source       = { :git => "https://github.com/denisprokopchuk/DPTransparentEdgesTableView.git", :tag => "0.1.1" }
  s.source_files  = "Classes/*"
  s.framework  = "QuartzCore"
  s.requires_arc = true
end
