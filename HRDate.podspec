Pod::Spec.new do |s|
  s.name             = "HRDate"
  s.version          = "0.1.1"
  s.summary          = "HRDate is a set of categories for simple date management."
  s.description      = "NSDate, NSDateFormatter, NSDateComponents, NSTimeZone and NSCalendar categories."

  s.homepage         = "https://github.com/ivanshevelev/HRDate"
  s.license          = 'MIT'
  s.author           = { "Ivan Shevelev" => "ivan.shevelev@sibers.com" }
  s.source           = { :git => "https://github.com/ivanshevelev/HRDate.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/antsy_ivan'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation'
end
