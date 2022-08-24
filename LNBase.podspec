#
# Be sure to run `pod lib lint LNBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LNBase'
  s.version          = '0.0.2'
  s.summary          = '流年的基础框架LNBase'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
流年的基础框架LNBase，包括常用分类、工具类等。
                       DESC

  s.homepage         = 'https://github.com/Fleetingz/LNBase'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangqiang' => '613555114@qq.com' }
  s.source           = { :git => 'https://github.com/Fleetingz/LNBase.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

  s.source_files = "LNBase/Classes/*.{h,m}"

  # 工具类
  s.subspec 'LNUtils' do |utils|
    utils.source_files = "LNBase/Classes/LNUtils/*.{h,m}"
  end

  #s.resource = "SCBaseFramework/Classes/SCBase/SCBase.framework/SCBase.bundle"

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Masonry'
  s.dependency 'YYModel'
  s.dependency 'YYText'
  s.dependency 'SVProgressHUD'
end
