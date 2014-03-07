Teacup::Stylesheet.new :collectible_details do
  import :base

  style :image,
    constraints: [
      :full,
      constrain_height(400)
    ]

  style :play_button,
    title: "Play Recording",
    constraints: [
      constrain_width(300),
      constrain_height(50),
      constrain(:left).equals(:superview, :left).plus(10),
      constrain(:bottom).equals(:superview, :bottom).plus(10),
    ]
end
