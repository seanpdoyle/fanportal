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
  end

  app.frameworks += [
    'AVFoundation'
  ]

  app.vendor_project("vendor/Git/ZoomRotatePanImageView", :static)
end
