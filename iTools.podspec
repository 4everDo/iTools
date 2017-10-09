#
#  Be sure to run `pod spec lint OBDataService.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    s.name         = "iTools"
    s.version      = "1.0.8"
    s.summary      = "Create Base Project"

    s.homepage     = "https://github.com/907376361/iTools"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author       = { "Alline" => "907376361@qq.com" }

    s.platform     = :ios, "8.0"
    s.source       = { :git => "https://github.com/907376361/iTools.git", :tag => s.version.to_s }

    s.requires_arc = true
    s.source_files = 'iTools/Classes/**/*.{h,m}'
    s.public_header_files = 'iTools/Classes/**/*.{h}'

    s.dependency 'AFNetworking'
    s.dependency 'MJRefresh'
    s.dependency 'FMDB'
end
