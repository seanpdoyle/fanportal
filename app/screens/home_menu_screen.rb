class HomeMenuScreen < PM::Screen
  stylesheet :home_menu_screen

  layout :modal do
    @close        = subview UIButton, :close
    @order        = subview UIButton, :order
    @collection   = subview UIButton, :collection

    subview(UIImageView, :logo)
  end

  def will_appear
    @close.on :touch do
      close
    end

    @order.on :touch do
      open OrderScreen, nav_bar: true, modal: true
    end
  end
end
