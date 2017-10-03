#
#  Be sure to run `pod spec lint OBDataService.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "iTools"
  s.version      = "1.0.6"
  s.summary      = "iTools ready Go"

  s.description  = <<-DESC
			iTools
		   DESC

  s.homepage     = "https://github.com/907376361/iTools"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "xiaoyun@521." => "907376361@qq.com" }
  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/907376361/iTools.git", :tag => "1.0.6" }

  s.source_files = "iTools/Classes/*.h"

  s.requires_arc  = true

s.subspec 'Category' do |category|
    category.source_files = 'iTools/Classes/Category/*'
    category.public_header_files = 'iTools/Classes/Category/*.h'
end

s.subspec 'ViewController' do |viewcontroller|
    viewcontroller.source_files = 'iTools/Classes/ViewController/*'
    viewcontroller.public_header_files = 'iTools/Classes/ViewController/*.h'
    viewcontroller.dependency 'MJRefresh', '~> 3.1.13'
    viewcontroller.dependency 'iTools/Classes/View'
end

s.subspec 'Model' do |model|
    model.source_files = 'iTools/Classes/Model/*'
    model.public_header_files = 'iTools/Classes/Model/*.h'
    model.dependency 'AFNetworking', '~> 3.1.0'
    model.dependency 'iTools/Classes/Tools'
end

s.subspec 'Tools' do |tools|
    tools.source_files = 'iTools/Classes/Tools/*'
    tools.public_header_files = 'iTools/Classes/Tools/*.h'
    tools.dependency 'FMDB', '~> 2.7.2'
    tools.dependency 'AFNetworking', '~> 3.1.0'
end

s.subspec 'View' do |views|
    views.source_files = 'iTools/Classes/View/*'
    views.public_header_files = 'iTools/Classes/View/*.h'
    views.dependency 'iTools/Classes/Model'
end

s.subspec 'Custom' do |custom|
    custom.source_files = 'iTools/Classes/Custom/*'
    custom.public_header_files = 'iTools/Classes/Custom/*.h'
end

end
