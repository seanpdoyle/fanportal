Teacup::Stylesheet.new :order_screen do
  import :base

  style :header,
    image: "order/bg_order_header",
    contentMode: UIViewContentModeScaleAspectFit,
    constraints: [
      constrain(:top).equals(:superview, :top)
    ]

  style :title,
    attributedText: "Personalized Autograph & Voice Message".bold,
    textColor: :white.uicolor,
    font: UIFont.fontWithName("AvenirNext-DemiBold", size: 14),
    constraints: [
      constrain(:center_x).equals(:superview, :center_x),
      constrain(:top).equals(:header, :top).plus(15)
    ]

  style :byline,
    text: "by Dream Theater",
    textColor: :white.uicolor,
    font: UIFont.fontWithName("AvenirNext-Regular", size: 13),
    constraints: [
      constrain(:center_x).equals(:superview, :center_x),
      constrain_below(:title, 5)
    ]

  style :features,
    constraints: [
      :full_width,
      constrain_height(295),
      constrain_below(:header, 8),
      constrain(:left).equals(:superview, :left).plus(12)
    ],
    scrollView: {
      bounces: false,
      scrollEnabled: false
    }

  style :order_table,
    scrollEnabled: false,
    alwaysBounceVertical: false,
    constraints: [
      :full_width,
      constrain_height(100),
      constrain(:top).equals(:features, :bottom)
    ]

  style :photo_title,
    text: "   Select Photo",
    textColor: :black.uicolor,
    textAlignment: NSTextAlignmentLeft,
    font: UIFont.fontWithName("AvenirNext-Bold", size: 14),
    backgroundColor: "#f5f5f5".uicolor,
    constraints: [
      :full_width,
      constrain_height(50),
      constrain_below(:order_table)
    ],
    layer: {
      borderColor: "#CBCBCB".uicolor.CGColor,
      borderWidth: 0.4
    }

  style :image_picker,
    backgroundColor: "#333333".uicolor,
    constraints: [
      :full_width,
      constrain_height(100),
      constrain_below(:photo_title, 14)
    ]

  style :image_picker_button,
    backgroundColor: :white.uicolor,
    image: "order/ic_upload".uiimage,
    contentMode: UIViewContentModeCenter | UIViewContentModeScaleAspectFill,
    constraints: [
      constrain_width(113),
      constrain_height(73),
      constrain(:top).equals(:superview, :top).plus(14),
      constrain(:left).equals(:superview, :left).plus(10)
    ]
end
