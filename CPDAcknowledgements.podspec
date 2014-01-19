Pod::Spec.new do |s|
  s.name         = "CPDAcknowledgements"
  s.version      = "0.0.1"
  s.summary      = "Show your CocoaPods dependencies in-app."
  s.description  = <<-DESC
                    A Customisable view controller 

                   DESC
  s.homepage     = "http://EXAMPLE/NAME"
  s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license      = 'MIT'
  s.author       = { "Orta Therox" => "orta.therox@gmail.com", "Fabio Pelosin" => "fabiopelosin@gmail.com" }
  s.source       = { :git => "https://github.com/CocoaPods/CPDAcknowledgements.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/CocoaPods"
  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true
  s.source_files = 'Classes'
  s.ios.source_files = 'Classes/ios'

end
