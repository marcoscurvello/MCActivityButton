#
# Be sure to run `pod lib lint MCActivityButton.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MCActivityButton"
  s.version          = "0.1.0.3"
  s.summary          = "MCActivityButton custom UIButton that animates an activity indicator."
  s.description      = <<-DESC
This custom button animates an activity indicator to the right or left of the button's title to indicate progress.'

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/marcoscurvello/MCActivityButton"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Marcos Curvello" => "mrcurvello@gmail.com" }
  s.source           = { :git => "https://github.com/marcoscurvello/MCActivityButton.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mrcurvello'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.{h,m}'
  s.resource_bundles = {
    'MCActivityButton' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'MCActivityButton.h,m'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
