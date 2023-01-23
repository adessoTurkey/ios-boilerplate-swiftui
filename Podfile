# Uncomment the next line to define a global platform for your project
# platform :ios, '14.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'BoilerPlateSwiftUI' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for boilerplate-ios-swiftui

  # Utils
  pod 'Swifter', '~> 1.5.0', :configurations => ['Swifter']
  pod 'CocoaDebug', '1.7.1', :configurations => ['Development','Swifter']

  target 'BoilerPlateSwiftUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BoilerPlateSwiftUIUITests' do
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      end
    end
  end

end
