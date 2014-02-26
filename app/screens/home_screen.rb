class HomeScreen < PM::Screen
  stylesheet :home_screen

  layout :root do
    subview(UIImageView, :background)
    subview(UILabel, :artist)
  end
end
