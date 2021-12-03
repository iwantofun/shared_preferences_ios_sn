#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'shared_preferences_ios_sn'
  s.version          = '0.0.1'
  s.summary          = 'iOS Shared Preferences Suite Name support'
  s.description      = <<-DESC
Wraps Flutter shared_preferences plugin, providing a iOS Suite Name support, it's helpful for sharing data from App to Widget.
                       DESC
  s.homepage         = 'https://github.com/iwantofun/shared_preferences_ios_sn'
  s.license          = { :type => 'BSD', :file => '../LICENSE' }
  s.author           = { 'WYY Dev Team' => 'iwantofun@gmail.com' }
  s.source           = { :http => 'https://github.com/flutter/plugins/tree/master/packages/shared_preferences/shared_preferences_ios_sn' }
  s.documentation_url = 'https://pub.dev/packages/shared_preferences_sn'
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  
  s.platform = :ios, '9.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end

