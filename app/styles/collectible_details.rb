Teacup::Stylesheet.new :collectible_details do
  import :base

  style :image,
    constraints: [
      constrain(:top).equals(:superview, :top),
      constrain(:left).equals(:superview, :left),
      constrain(:right).equals(:superview, :right),
      constrain(:height).equals(:superview, :height)
    ]

  style :play_button,
    title: "PLAY RECORDING",
    titleColor: "#59db97".uicolor,
    backgroundColor: "#333333".uicolor,
    font: UIFont.fontWithName("AvenirNext-Bold", size: 18),
    constraints: [
      constrain_height(50),
      constrain(:right).equals(:superview, :right).minus(10),
      constrain(:left).equals(:superview, :left).plus(10),
      constrain(:bottom).equals(:superview, :bottom).minus(10)
    ]
end
