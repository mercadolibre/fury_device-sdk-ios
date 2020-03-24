source 'https://github.com/CocoaPods/Specs.git'

plugin 'cocoapods-whitelist'

workspace 'devices'

platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

install! 'cocoapods', disable_input_output_paths: true

target 'ExampleObjC' do
  project 'ExampleObjC/ExampleObjC.xcodeproj'
  pod 'MercadoPagoDevicesSDK', :path => './', inhibit_warnings: false
end

target 'ExampleSwift' do
  project 'ExampleSwift/ExampleSwift.xcodeproj'
  pod 'MercadoPagoDevicesSDK', :path => './', inhibit_warnings: false
end

target 'TestsApp' do
  target 'Tests' do
      project './MercadoPagoDevicesSDK.xcodeproj'
      pod 'MercadoPagoDevicesSDK', :path => './', inhibit_warnings: false
      pod 'Nimble', '~> 8.0.4'
      pod 'Quick', '~> 2.2.0'
  end
end
