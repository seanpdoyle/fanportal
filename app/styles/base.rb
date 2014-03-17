Teacup::Stylesheet.new :base do
  import :sweettea

  style :root,
    backgroundColor: :black.uicolor

  style :action,
    backgroundColor: :white.uicolor

  style :modal,
    backgroundColor: :clear.uicolor

  style :nav_button,
    titleColor: "#37B755".uicolor

  style :scroll,
    constraints: [
      :full
    ]

  style :close,
    image: "home/ic_close",
    constraints: [
      constrain_left(2),
      constrain_top(18),
      constrain_height(50),
      constrain_width(50)
    ]

  style :background,
    contentMode: UIViewContentModeScaleAspectFill,
    alpha: 0.3,
    constraints: [
      :centered,
      :full_height
    ]
end
