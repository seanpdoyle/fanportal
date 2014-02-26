Teacup::Stylesheet.new :home_screen do
  import :base

  style :background,
    image: "home/bg_metallica".uiimage,
    alpha: 0.3,
    constraints: [
      :full_height,
      constrain(:center_x).equals(:superview, :center_x)
    ]

  style :artist,
    text: "Metallica",
    alpha: 0.3,
    textColor: :white.uicolor,
    constraints: [
      constrain(:left).equals(:superview, :left).plus(10),
      constrain(:bottom).equals(:superview, :bottom).minus(10)
    ]
end
