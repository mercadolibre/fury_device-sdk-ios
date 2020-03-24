Pod::Spec.new do |s|
  s.name             = 'MercadoPagoDevicesSDK'
  s.version          = '1.0.0'
  s.summary          = 'MercadoPagoDevicesSDK'

  s.homepage         = 'https://github.com/mercadolibre/fury_device-sdk-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'devices' => 'device@mercadolibre.com' }
  s.source           = { :git => 'git@github.com:mercadolibre/fury_device-sdk-ios.git', :tag => s.version.to_s }
  s.platform         = :ios, '10.0'

  s.source_files = 'LibraryComponents/Classes/**/*.{h,m,swift}'
  

end
