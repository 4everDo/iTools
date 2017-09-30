#
#  Be sure to run `pod spec lint OBDataService.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "iTools"
  s.version      = "1.0.3"
  s.summary      = "创建初始项目，以后会继续维护更新,后续维护"

  s.description  = <<-DESC
			添加弹出框工具类，完善网络请求
		   DESC

  s.homepage     = "https://github.com/907376361/iTools"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "xiaoyun@521." => "907376361@qq.com" }
  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/907376361/iTools.git", :tag => "1.0.3" }

  s.source_files  = "iTools/Classes/*.{h,m}"
  s.public_header_files = "iTools/Classes/**/*.h"

  s.requires_arc  = true

  s.dependency 'AFNetworking', '~> 3.1.0'
  s.dependency 'MJExtension', '~> 3.0.13'
  s.dependency 'FMDB', '~> 2.7.2'
  s.dependency 'MJRefresh', '~> 3.1.13'

end
