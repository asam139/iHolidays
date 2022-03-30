#
# Be sure to run `pod lib lint iHolidaysDomain.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iHolidaysDomain'
  s.version          = '0.1.0'
  s.summary          = 'A short description of iHolidaysDomain.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Saúl Moreno/iHolidaysDomain'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Saúl Moreno' => 'saul.moreno@experis.es' }
  s.source           = { :git => 'https://github.com/Saúl Moreno/iHolidaysDomain.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'Sources/iHolidaysDomain/**/*.{h,m,swift}'
  s.resource_bundles = {
    'iHolidaysDomain_iHolidaysDomain' => 'Sources/iHolidaysDomain/Resources/**/*.{xcdatamodeld,storyboard,xib,png,json,jpg,imageset,xcassets}'
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'RxSwift', '~> 6.1'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/iHolidaysDomainTests/**/*.{h,m,swift}'
    test_spec.dependency 'Quick', '~> 3.0.0'
    test_spec.dependency 'Nimble', '~> 9.0.0'
    test_spec.dependency 'RxTest'
    test_spec.dependency 'RxBlocking'
    
    test_spec.script_phases = [
      { :name => 'Sourcery',
        :script => '${PODS_TARGET_SRCROOT}/Scripts/sourcery.sh',
        :execution_position => :before_compile
      }
    ]
  end
end
