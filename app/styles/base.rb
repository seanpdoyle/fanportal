Teacup::Stylesheet.new :base do

  style :root,
    backgroundColor: :black.uicolor

  style :action,
    backgroundColor: :white.uicolor

  style :modal,
    backgroundColor: :clear.uicolor

  style :navButton,
    titleColor: "37B755".uicolor

  style :scroll,
    constraints: [
      :full
    ]

end
