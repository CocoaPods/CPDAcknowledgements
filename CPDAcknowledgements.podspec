Pod::Spec.new do |s|
  s.name         = "CPDAcknowledgements"
  s.version      = "0.0.1"
  s.summary      = "Show your CocoaPods dependencies in-app."
  s.description  = <<-DESC
                    Show your CocoaPods library and contributors in-app with smart defaults, and view controllers.
                   DESC
  s.homepage     = "https://github.com/CocoaPods/CPDAcknowledgements"
  s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license      = 'MIT'
  s.author       = { "Orta Therox" => "orta.therox@gmail.com", "Fabio Pelosin" => "fabiopelosin@gmail.com" }
  s.source       = { :git => "https://github.com/CocoaPods/CPDAcknowledgements.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/CocoaPods"
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true
  s.source_files = 'Classes'
  s.ios.source_files = 'Classes/ios'
  s.ios.frameworks = 
end
