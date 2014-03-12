class HomeMenuScreen < PM::Screen
  stylesheet :home_menu_screen

  layout :modal do
    @background   = subview(GRKBlurView, :blurred_background)

    @close        = subview UIButton, :close
    @order        = subview UIButton, :order
    @collection   = subview UIButton, :collection

    subview(UIImageView, :logo)
  end

  def will_appear
    @background.update

    @close.when_tapped do
      close animated: false
    end

    @order.when_tapped do
      open OrderScreen, nav_bar: true, modal: true
    end

    @collection.when_tapped do
      open CollectionScreen, nav_bar: true, modal: true
    end
  end

  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end
end
