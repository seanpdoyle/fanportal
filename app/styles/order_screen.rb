Teacup::Stylesheet.new :order_screen do
  import :base

  style :header,
    image: "order/bg_order_header",
    contentMode: UIViewContentModeScaleAspectFit,
    constraints: [
      constrain(:top).equals(:scroll, :top)
    ]

  style :title,
    attributedText: "Personalized Autograph & Voice Message".bold,
    textColor: :white.uicolor,
    font: UIFont.fontWithName('AvenirNext-DemiBold', size: 14),
    constraints: [
      constrain(:center_x).equals(:superview, :center_x),
      constrain(:top).equals(:header, :top).plus(15)
    ]

  style :byline,
    text: "by Dream Theater",
    textColor: :white.uicolor,
    font: UIFont.fontWithName('AvenirNext-Regular', size: 13),
    constraints: [
      constrain(:center_x).equals(:superview, :center_x),
      constrain_below(:title, 5)
    ]

  style :features,
    constraints: [
      :full_width,
      constrain_height(500),
      constrain_below(:header, 8),
      constrain(:left).equals(:superview, :left).plus(12)
    ]
end
