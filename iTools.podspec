#
#  Be sure to run `pod spec lint OBDataService.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "iTools"
s.version      = "0.1.6"
s.summary      = "基础框架整理"

s.homepage     = "https://github.com/907376361/iTools"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "Allien" => "907376361@qq.com" }

s.platform     = :ios, "8.0"

s.source       = { :git => "https://github.com/907376361/iTools.git", :tag => "#{s.version}" }
s.source_files = 'iTools/Classes/iTools.h'
s.public_header_files = 'iTools/Classes/iTools.h'
s.requires_arc = true


s.subspec 'Custom' do |custom|
custom.source_files = 'iTools/Classes/Custom/*'
custom.public_header_files = 'iTools/Classes/Custom/*.h'
end

s.subspec 'ViewControllers' do |controllers|
controllers.source_files = 'iTools/Classes/ViewControllers/*'
controllers.public_header_files = 'iTools/Classes/ViewControllers/*.h'
controllers.dependency 'iTools/Views'
controllers.dependency 'MJRefresh'
end

s.subspec 'Models' do |models|
models.source_files = 'iTools/Classes/Models/*'
models.public_header_files = 'iTools/Classes/Models/*.h'
models.dependency 'iTools/Tools'
end

s.subspec 'Tools' do |tools|
tools.source_files = 'iTools/Classes/Tools/*'
tools.public_header_files = 'iTools/Classes/Tools/*.h'
tools.dependency 'AFNetworking'
tools.dependency 'MBProgressHUD'
tools.dependency 'CocoaCategory'
end

s.subspec 'Views' do |views|
views.source_files = 'iTools/Classes/Views/*'
views.public_header_files = 'iTools/Classes/Views/*.h'
views.dependency 'iTools/Tools'
views.dependency 'iTools/Models'
tools.dependency 'CocoaCategory'
end

s.frameworks = 'UIKit'
s.frameworks = 'Security'
s.frameworks = 'Foundation'
s.frameworks = 'CoreGraphics'
s.frameworks = 'MobileCoreServices'
s.frameworks = 'SystemConfiguration'



# s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
# s.dependency "JSONKit", "~> 1.4"
# s.dependency "MBProgressHUD"

end
