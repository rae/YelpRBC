source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'YelpRBC' do
	pod 'Alamofire', '~> 4.0'
end

# force targets to be Swift 3 (Alamofire ships without this setting)
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
