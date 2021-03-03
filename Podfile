# Uncomment the next line to define a global platform for your project
platform :ios, '14.3'
inhibit_all_warnings!

def addScriptForLint
  script = '"${PODS_ROOT}/SwiftLint/swiftlint" autocorrect --format'
  script_phase :name => 'Lint', :script => script, :execution_position => :before_compile
end

def addScritForRSwift
  script = '"$PODS_ROOT/R.swift/rswift" generate "$SRCROOT/iHolidays/R/R.generated.swift"'
  input_files = ['$TEMP_DIR/rswift-lastrun']
  output_files = ['$SRCROOT/iHolidays/R/R.generated.swift']
  script_phase :name => 'R.swift', :script => script, :input_files => input_files, :output_files => output_files, :execution_position => :before_compile
end

target 'iHolidays' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Private
  pod 'iHolidaysDomain', :path => './Packages/iHolidaysDomain', :testspecs => ['Tests']
  pod 'iHolidaysData', :path => './Packages/iHolidaysData', :testspecs => ['Tests']
  
  # DI
  pod 'Swinject', '~> 2.7.1'
  
  # Base
  pod 'RxSwift', '~> 5.1.1'
  pod 'RxCocoa', '~> 5.1.1'
  
  # Networking
  pod 'Moya/RxSwift', '~> 14.0.0'

  # UI
  pod 'XCoordinator/RxSwift', '~> 2.0.7'
  pod 'SDWebImage', '~> 5.10.4'
  
  # Tools
  pod 'R.swift', '~> 5.3.1'
  pod 'SwiftLint', '~> 0.42.0'
  
  # Scripts
  addScriptForLint
  addScritForRSwift

  target 'iHolidaysTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'iHolidaysUITests' do
    # Pods for testing
  end
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 9.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
      end
    end
    
    project.targets.each do |target|
      target.build_configurations.each do |config|
        if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 9.0
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
        end
      end
    end
  end
  
  # Tests
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
          if config.name == 'Debug'
              config.build_settings['ENABLE_TESTABILITY'] = 'YES'
          end
      end
  end
end
