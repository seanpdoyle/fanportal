class AppDelegate < PM::Delegate

  def on_load(app, options)
    setupUrbanAirship(options)
    setAppearanceDefaults
    open HomeScreen
  end

  def on_push_notification(notification, launched)
    open(
      CollectibleDetailsScreen.new(
        collectible: Collectible.all.first,
        nav_bar: false
      )
    )
  end

  def application(application, didRegisterForRemoteNotificationsWithDeviceToken:deviceToken)
    UAirship.shared.registerDeviceToken( deviceToken )
  end

  def setupUrbanAirship(launchOptions)
    takeOffOptions = NSMutableDictionary.alloc.init
    takeOffOptions.setValue( launchOptions, forKey: UAirshipTakeOffOptionsLaunchOptionsKey )

    UAirship.takeOff( takeOffOptions )

    UIApplication.sharedApplication.registerForRemoteNotificationTypes(
      UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound
    )
  end

  def setAppearanceDefaults
    Teacup::Appearance.apply

    UINavigationBar.appearance.tap do |config|
      config.tintColor = :white.uicolor
      config.setTitleTextAttributes({
        UITextAttributeFont => UIFont.fontWithName('AvenirNext-Medium', size: 16),
        UITextAttributeTextColor => "#333333".uicolor
      })
    end

    UIBarButtonItem.appearance.tap do |config|
      config.setTitleTextAttributes({
        UITextAttributeFont => UIFont.fontWithName('AvenirNext-Regular', size: 16),
        UITextAttributeTextColor => "#37b755".uicolor
      }, forState: UIControlStateNormal)
      config.setTitleTextAttributes({
        UITextAttributeTextColor => "#b3b3b3".uicolor
      }, forState: UIControlStateDisabled)
    end
  end
end
