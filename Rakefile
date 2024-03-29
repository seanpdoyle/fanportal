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
    pod 'FDTake'
    pod 'SDWebImage'
    pod 'GRKBlurView'
    pod 'GVPhotoBrowser'
    pod 'UrbanAirship-iOS-SDK', '~> 3.0'
  end

  app.name                 = "FanPortal"
  app.identifier           = "com.fanportal.iphone"
  app.provisioning_profile = "provision/FanPortal_iPhone.mobileprovision"
  app.codesign_certificate = "iPhone Developer: Kostas Nasis (6NK7DS8B4W)"

  app.interface_orientations = [:portrait]

  app.seed_id = "E4Y3VW47MT"
  app.entitlements['application-identifier'] = app.seed_id + '.' + app.identifier
  app.entitlements['keychain-access-groups'] = [
    app.seed_id + '.' + app.identifier
  ]

  app.entitlements['aps-environment'] = 'development'
  app.entitlements['get-task-allow'] = true

  app.icons = [
    'icons/AppIcon29x29.png',
    'icons/AppIcon60x60@2x.png',
    'icons/AppIcon29x29@2x.png ',
    'icons/AppIcon76x76.png',
    'icons/AppIcon40x40.png',
    'icons/AppIcon76x76@2x.png',
    'icons/AppIcon40x40@2x.png',
    'icons/iTunesArtwork.png',
    'icons/AppIcon60x60.png',
    'icons/iTunesArtwork@2x.png'
  ]

  # Urban Airship framework setup
  app.libs += [
    '/usr/lib/libz.dylib',
    '/usr/lib/libsqlite3.dylib'
  ]

  app.frameworks += [
    'AssetsLibrary',
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
end
