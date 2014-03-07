Teacup::Stylesheet.new :base do
  import :sweettea

  style :root,
    backgroundColor: :black.uicolor

  style :action,
    backgroundColor: :white.uicolor

  style :modal,
    backgroundColor: :clear.uicolor

  style :navButton,
    titleColor: "37B755".uicolor

  style :scroll,
    autoresizingMask: UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight,
    constraints: [
      :full
    ]

  style :background,
    contentMode: UIViewContentModeScaleAspectFill,
    alpha: 0.3,
    constraints: [
      :centered,
      :full_height
    ]

end
