class OrderScreen < PM::Screen
  title "Get this Collectible"

  stylesheet :order_screen

  layout :action do
    subview UIScrollView, :scroll do
      subview UIImageView, :header
      subview UILabel, :title
      subview UILabel, :byline
      @features = subview UIWebView, :features
    end
  end

  def on_init
    set_nav_bar_button :left,
      title: "Cancel",
      action: :close
  end

  def will_appear
    @features.loadRequest NSURLRequest.requestWithURL("features.html".resource_url)
  end

end
