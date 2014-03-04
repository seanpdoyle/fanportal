Teacup::Stylesheet.new :home_menu_screen do
  import :base

  style UIButton,
    backgroundColor: :clear.uicolor,
    color: :white.uicolor,
    highlighted: {
      color: :gray.uicolor,
    }

  style :blurred_background, extends: :background,
    targetImage: "home/bg_metallica".uiimage,
    blurRadius: 15


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

  style :home_action,
    font: UIFont.fontWithName('AvenirNext-Regular', size: 21.97)

  style :order, extends: :home_action,
    title: "Order Collectible",
    constraints: [
      constrain(:left).equals(:superview, :left).plus(70),
      constrain(:center_y).equals(:superview, :center_y).minus(40)
    ]

  style :collection, extends: :home_action,
    title: "My Collection",
    constraints: [
      constrain(:left).equals(:order, :left),
      constrain(:center_y).equals(:superview, :center_y).plus(40)
    ]

end
