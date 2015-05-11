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
  s.version          = "0.2.1"
  s.summary          = "UIButton subclass that animates a custom message with an activity indicator."
  s.description      = <<-DESC
  `MCActivityButton` is an objective-c `UIButton` subclass that animates a standard iOS activity indicator with a custom title when tapped.'

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/marcoscurvello/MCActivityButton"
  s.screenshots      = "https://raw.githubusercontent.com/marcoscurvello/MCActivityButton/master/Screenshots/screenshot0.png", "https://raw.githubusercontent.com/marcoscurvello/MCActivityButton/master/Screenshots/screenshot1.png"
  s.license          = 'MIT'
  s.author           = { "Marcos Curvello" => "mrcurvello@gmail.com" }
  s.source           = { :git => "https://github.com/marcoscurvello/MCActivityButton.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mrcurvello'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MCActivityButton' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'MCActivityButton.h,m'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
