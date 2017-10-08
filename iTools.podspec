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
s.summary      = "Create Base Project"

s.homepage     = "https://github.com/907376361/iTools"
s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
s.author       = { "Alline" => "907376361@qq.com" }

s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/907376361/iTools.git", :tag => "#{s.version}" }

s.requires_arc = true

s.subspec 'Category' do |category|
    category.source_files = 'iTools/Classes/Category/**/*.{h,m}'
end

s.subspec 'Custom' do |custom|
    custom.source_files = 'iTools/Classes/Custom/**/*.{h.m}'
end

s.subspec 'Model' do |model|
    model.source_files = 'iTools/Classes/Model/**/*.{h.m}'
    model.dependency  'Tools/tools'
end


s.subspec 'Tools' do |tools|
    tools.source_files = 'iTools/Classes/Tools/**/*.{h.m}'
    tools.dependency 'AFNetworking'
end

s.subspec 'View' do |view|
    view.source_files = 'iTools/Classes/View/**/*.{h.m}'
    view.dependency 'Model/model'
end

s.subspec 'ViewController' do |vc|
    vc.source_files = 'iTools/Classes/ViewController/**/*.{h.m}'
    vc.dependency 'View/view'
end

s.frameworks = 'UIKit'

end
