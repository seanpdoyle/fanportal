Teacup::Stylesheet.new :home_menu_screen do
  import :base

  style :navigation,
    color: :white.uicolor

  style :close,
    image: "home/ic_close".uiimage,
    constraints: [
      constrain(:left).equals(:superview, :left).plus(10),
      constrain(:top).equals(:superview, :top).plus(16)
    ]

  style :logo,
    image: "home/bg_fpLogo".uiimage,
    constraints: [
      constrain(:right).equals(:superview, :right).minus(10),
      constrain(:bottom).equals(:superview, :bottom).minus(10)
    ]

  style :order,
    extends: :navigation,
    title: "Order Collectible",
    constraints: [
      constrain(:left).equals(:superview, :left).plus(70),
      constrain(:center_y).equals(:superview, :center_y).minus(40)
    ]

  style :collection,
    extends: :navigation,
    title: "My Collection",
    constraints: [
      constrain(:left).equals(:superview, :left).plus(70),
      constrain(:center_y).equals(:superview, :center_y).plus(40)
    ]

end
