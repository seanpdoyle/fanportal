Teacup::Stylesheet.new :collection_screen do
  import :base

  style :collection_scroll, extends: :scroll,
    backgroundColor: "#f5f5f5".uicolor
end
