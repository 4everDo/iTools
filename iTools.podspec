#
#  Be sure to run `pod spec lint OBDataService.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "iTools"
s.version      = "0.0.1"
s.summary      = "Base Tools Classes"

s.homepage     = "https://github.com/907376361/iTools"
s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
s.author             = { "Allien" => "907376361@qq.com" }

s.platform     = :ios, "7.0"

s.source       = { :git => "https://github.com/907376361/iTools.git", :tag => "#{s.version}" }

s.requires_arc = true

s.subspec 'Tools' do |tool|
tool.source_files = 'iTools/Classes/Tools/*.{h,m}'
tool.dependency 'AFNetworking', '~> 3.0'
end

s.subspec 'Models' do |model|
model.source_files = 'iTools/Classes/Models/*.{h,m}'
model.dependency 'iTools/Classes/Tools'
end

s.subspec 'Views' do |view|
view.source_files = 'iTools/Classes/Views/*.{h,m}'
view.dependency 'iTools/Classes/Models'
end

s.subspec 'ViewControllers' do |vc|
vc.source_files = 'iTools/Classes/ViewControllers/*.{h,m}'
vc.dependency 'iTools/Classes/Views'
end

s.frameworks = 'UIKit'
s.frameworks = 'Security'
s.frameworks = 'Foundation'
s.frameworks = 'CoreGraphics'
s.frameworks = 'MobileCoreServices'
s.frameworks = 'SystemConfiguration'

# s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
# s.dependency "JSONKit", "~> 1.4"

end
