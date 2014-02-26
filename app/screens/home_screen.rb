class HomeScreen < PM::Screen
  stylesheet :home_screen

  layout :root do
    @image  = subview UIButton, :background
    @artist = subview UILabel, :artist
  end

  def will_appear
    @image.on :touch do
      open HomeMenuScreen, modal: true, animated: true
    end
  end
end
