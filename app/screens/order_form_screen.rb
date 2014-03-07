class OrderFormScreen < PM::FormotionScreen
  include Teacup::TableViewDelegate
  
  stylesheet :order_form_screen

  attr_accessor :order

  def on_init
    set_nav_bar_button :right,
      title: "OK",
      action: :save
  end

  def save
    form.submit
    close(order: order)
  end
end
