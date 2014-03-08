class AppDelegate < PM::Delegate

  def on_load(app, options)
    setAppearanceDefaults
    open HomeScreen
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
