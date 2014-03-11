# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Dotenv.load

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'fanportal'

  app.pods do
    pod 'GRKBlurView'
    pod 'UrbanAirship-iOS-SDK', '~> 3.0'
  end

  app.name                 = "FanPortal"
  app.identifier           = "com.fanportal.iphone"
  app.provisioning_profile = "provision/FanPortal_iPhone.mobileprovision"

  # Urban Airship framework setup
  app.libs += [
    '/usr/lib/libz.dylib',
    '/usr/lib/libsqlite3.dylib'
  ]

  app.frameworks += [
    'AVFoundation',
    'Security',
    'CFNetwork',
    'MobileCoreServices',
    'SystemConfiguration',
    'CoreTelephony',
    'StoreKit',
    'CoreLocation',
    'MessageUI',
    'AudioToolbox',
    'MapKit'
  ]

  app.vendor_project("vendor/Git/ZoomRotatePanImageView", :static)
end
