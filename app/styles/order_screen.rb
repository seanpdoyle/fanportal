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

  style :features_title,
    attributedText: "Special Edition Features".bold,
    font: UIFont.fontWithName('AvenirNext-Bold', size: 14),
    constraints: [
      constrain_below(:header, 16),
      constrain(:left).equals(:superview, :left).plus(12)
    ]

  style :features,
    font: UIFont.fontWithName('AvenirNext-Regular', size: 12),
    numberOfLines: 3,
    text: """
      • Only 100 available
      • Autographs signed by the band
      • Personalized voice message from guitarist John Petrucci
      """.strip


  style :features_left, extends: :features,
    constraints: [
      constrain_below(:features_title, 16),
      constrain(:left).equals(:features_title, :left)
    ]

  style :features_right, extends: :features,
    constraints: [
      constrain(:top).equals(:features_left, :top),
      constrain(:left).equals(:features_left, :right).plus(4)
    ]
end
