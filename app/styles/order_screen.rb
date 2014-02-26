Teacup::Stylesheet.new :order_screen do
  import :base

  style :header,
    image: "order/bg_order_header",
    contentMode: UIViewContentModeScaleAspectFit,
    constraints: [
      constrain(:top).equals(:scroll, :top)
    ]

  style :title,
    text: "Personalized Autograph & Voice Message",
    textColor: :white.uicolor,
    font: UIFont.fontWithName('Avenir Next Demi Bold', size: 14),
    constraints: [
      constrain(:center_x).equals(:superview, :center_x),
      constrain(:top).equals(:header, :top).plus(15)
    ]

  style :byline,
    text: "by Dream Theater",
    textColor: :white.uicolor,
    font: UIFont.fontWithName('Avenir Next Demi Bold', size: 13),
    constraints: [
      constrain(:center_x).equals(:superview, :center_x),
      constrain_below(:title, 5)
    ]
end
