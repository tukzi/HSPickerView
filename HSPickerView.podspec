#
# Be sure to run `pod lib lint HSPickerView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HSPickerView'
  s.version          = '1.0.0'
  s.summary          = '一款通用的选择器'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
YKPickerView 封装了省份城市选择，时间日期选择，普通文字选项选择，只为使用更简单。
                       DESC

  s.homepage         = 'https://github.com/tukzi/HSPickerView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'songhe' => 'hesong_ios@163.com' }
  s.source           = { :git => 'https://github.com/tukzi/HSPickerView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'HSPickerView/**/*.{h,m}'
  
  s.resources = 'HSPickerView/**/*.bundle'

   s.public_header_files = 'HSPickerView/Classes/*.h'
   s.frameworks = 'UIKit', 'Foundation'
   s.dependency 'YYModel', '~> 1.0.4'
end
