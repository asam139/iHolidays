# Uncomment the next line to define a global platform for your project
platform :ios, '14.3'
inhibit_all_warnings!

def addScriptForLint
  script = '"${PODS_ROOT}/SwiftLint/swiftlint" autocorrect --format'
  script_phase :name => 'Lint', :script => script, :execution_position => :before_compile
end

def addScritForRSwift
  script = '"$PODS_ROOT/R.swift/rswift" generate "$SRCROOT/iHolidays/R/R.generated.swift"'
  output_files = ['$SRCROOT/iHolidays/R/R.generated.swift']
  script_phase :name => 'R.swift', :script => script, :output_files => output_files, :execution_position => :before_compile
end

target 'iHolidays' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Private
  pod 'iHolidaysDomain', :path => './Packages/iHolidaysDomain', :testspecs => ['Tests']
  pod 'iHolidaysData', :path => './Packages/iHolidaysData', :testspecs => ['Tests']
  
  # DI
  pod 'Swinject', '~> 2.8'
  
  # Base
  pod 'RxSwift', '~> 6.1'
  pod 'RxCocoa'
  
  # Networking
  pod 'Moya/RxSwift', '~> 15.0'

  # UI
  pod 'XCoordinator/RxSwift', '~> 2.2'
  pod 'SDWebImage', '~> 5.12'
  pod 'RxDataSources', '~> 5.0'
  
  # Tools
  pod 'R.swift', '~> 6.1.0'
  pod 'SwiftLint', '~> 0.47.0'
  
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
