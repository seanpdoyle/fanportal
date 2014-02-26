Teacup::Stylesheet.new :home_menu_screen do
  import :base

  style UIButton,
    titleColor: :white.uicolor,
    backgroundColor: :clear.uicolor

  style :close,
    image: "home/ic_close",
    constraints: [
      constrain_left(10),
      constrain_top(16)
    ]

  style :logo,
    image: "home/bg_fpLogo",
    constraints: [
      constrain(:right).equals(:superview, :right).minus(10),
      constrain(:bottom).equals(:superview, :bottom).minus(10),
    ]

  style :order,
    title: "Order Collectible",
    constraints: [
      constrain(:left).equals(:superview, :left).plus(70),
      constrain(:center_y).equals(:superview, :center_y).minus(40)
    ]

  style :collection,
    title: "My Collection",
    constraints: [
      constrain(:left).equals(:superview, :left).plus(70),
      constrain(:center_y).equals(:superview, :center_y).plus(40)
    ]

end
