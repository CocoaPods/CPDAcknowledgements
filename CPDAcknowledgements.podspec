Pod::Spec.new do |s|
  s.name         = "CPDAcknowledgements"
  s.version      = "1.0.0"
  s.summary      = "Show your CocoaPods dependencies in-app."
  s.description  = <<-DESC
                    Show your CocoaPods library and contributors in-app with smart defaults, and customisable view controllers.
                   DESC
  s.homepage     = "https://github.com/CocoaPods/CPDAcknowledgements"
  s.license      = 'MIT'
  s.author       = { "Orta Therox" => "orta.therox@gmail.com", "Fabio Pelosin" => "fabiopelosin@gmail.com" }
  s.source       = { :git => "https://github.com/CocoaPods/CPDAcknowledgements.git", :tag => s.version.to_s }
  s.homepage      = "https://github.com/CocoaPods/CPDAcknowledgements"
  s.social_media_url = "https://twitter.com/CocoaPods"
  s.ios.deployment_target = '8.0'
  s.source_files = 'CPDAcknowledgements/**/**'
  s.private_header_files = 'CPDAcknowledgements/private/*.h'
  s.ios.frameworks = 'UIKit'
end
