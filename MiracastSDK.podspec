#
# Be sure to run `pod lib lint MiracastSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MiracastSDK'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MiracastSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.name = "MiracastSDK"
  s.version = "0.1.0"
  s.summary = "MiracastSDK"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"njuluckwang"=>"njuluckwang@gmail.com"}
  s.homepage = "https://github.com/luckymore0520/MiracastSDK"
  s.description = "MiracastSDK"
  s.requires_arc = true
  s.source   = { :git => 'https://github.com/luckymore0520/MiracastSDK.git', :tag => s.version}

  s.ios.deployment_target    = '9.0'
  s.ios.source_files = ['MiracastSDK/Public/*.h']
  s.ios.public_header_files = ['MiracastSDK/Public/*.h']
  s.ios.vendored_libraries   = 'MiracastSDK/libMiracastSDK.a'
  s.libraries = 'xml2','z'
  s.framework = "LocalAuthentication", "MobileCoreServices", "Photos", "SystemConfiguration", "MediaPlayer", "AVFoundation", "MapKit", "Foundation", "UIKit", "CoreGraphics", "AudioToolbox", "CoreImage", "Accelerate", "QuartzCore"
  s.resources = 'MiracastSDK/Resources/Miracast.xcassets'
end
