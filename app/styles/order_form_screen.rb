Teacup::Stylesheet.new :order_form_screen do
  import :base

  style :prompt,
    textColor: "#b3b3b3".uicolor,
    textAlignment: NSTextAlignmentCenter,
    font: UIFont.fontWithName("AvenirNext-Medium", size: 14),
    backgroundColor: :white.uicolor,
    layer: {
      borderColor: "#c8c8c8".uicolor.CGColor,
      borderWidth: 0.3
    },
    constraints: [
      :full_width,
      constrain(:top).equals(:superview, :top).plus(65),
      constrain_height(35)
    ]

  style :text_field,
    constraints: [
      :full_width,
      constrain_height(240),
      constrain_below(:prompt)
    ]

  style :character_counter,
    textColor: "#0091bb".uicolor,
    font: UIFont.fontWithName("AvenirNext-Bold", size: 16),
    constraints: [
      constrain_width(50),
      # constrain_below(:text_field),
      constrain(:right).equals(:superview, :right).minus(10)
    ]
end
