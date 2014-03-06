class OrderScreen < PM::FormotionScreen
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
    @features.scrollView.tap do |config|
      config.bounces       = false
      config.scrollEnabled = false
    end
  end

  def on_submit(_form)
  end

  def table_data
    {
      sections: [{
        rows: [
          title: "Goto",
          type: :subform,
          subform: {
            title: 'Subform',
            sections: [{
              rows: [{
                title: 'Mordor',
                type: :static,
              }]
            }]
          }
        ]
      }]
    }
  end
end
