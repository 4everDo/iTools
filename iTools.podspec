#
#  Be sure to run `pod spec lint OBDataService.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "iTools"
  s.version      = "1.0.1"
  s.summary      = "创建初始项目，以后会继续维护更新"

  s.description  = <<-DESC
			创建初始项目，以后会继续维护更新,后续维护加油
		   DESC

  s.homepage     = "https://github.com/907376361/iTools"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "xiaoyun@521." => "907376361@qq.com" }
  s.platform     = :ios, "6.0"


  s.source       = { :git => "https://github.com/907376361/iTools.git", :tag => "1.0.1" }

  s.source_files  = "iTools/Classes/**/*.{h,m}"

  s.requires_arc  = true

  s.dependency 'AFNetworking'
  s.dependency 'MJExtension'
  s.dependency 'FMDB'
  s.dependency 'MJRefresh'

end
