class OrderScreen < PM::Screen
  title "Get this Collectible"

  stylesheet :order_screen

  layout :action do
    subview UIScrollView, :scroll do
      subview UIImageView, :header
      subview UILabel, :title
      subview UILabel, :byline
    end
  end

  def on_init
    set_nav_bar_button :left,
      title: "Cancel",
      style: :navButton,
      action: :close
  end
end
