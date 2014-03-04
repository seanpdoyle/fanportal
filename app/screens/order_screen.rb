class OrderScreen < PM::Screen
  title "Get this Collectible"

  stylesheet :order_screen

  layout :action do
    subview UIScrollView, :scroll do
      subview UIImageView, :header
      subview UILabel, :title
      subview UILabel, :byline
      subview UILabel, :features_title
      subview UILabel, :features_left
      subview UILabel, :features_right
    end
  end

  def on_init
    set_nav_bar_button :left,
      title: "Cancel",
      action: :close
  end
end
