Pod::Spec.new do |s|
  s.name = "MiracastSDK"
  s.version = "0.1.0"
  s.summary = "MiracastSDK"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"njuluckwang"=>"njuluckwang@gmail.com"}
  s.homepage = "https://github/luckymore0520/MiracastSDK"
  s.description = "MiracastSDK"
  s.requires_arc = true
  s.source   = { :git => 'https://github.com/luckymore0520/MiracastSDK', :tag => s.version}

  s.ios.deployment_target    = '9.0'
  s.ios.source_files = ['MiracastSDK/ios/Public/*.h']
  s.ios.public_header_files = ['MiracastSDK/ios/Public/*.h']
  s.ios.vendored_libraries   = 'MiracastSDK/ios/libMiracastSDK.a'
  s.libraries = 'xml2','z'
  s.framework = "LocalAuthentication", "MobileCoreServices", "Photos", "SystemConfiguration", "MediaPlayer", "AVFoundation", "MapKit", "Foundation", "UIKit", "CoreGraphics", "AudioToolbox", "CoreImage", "Accelerate", "QuartzCore"
  s.resources = 'Assets/Miracast.xcassets'
end