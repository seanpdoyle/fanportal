class HomeScreen < PM::Screen
  stylesheet :home_screen

  layout :root do
    @image  = subview UIImageView, :metallica
    @artist = subview UILabel, :artist
  end

  def will_appear
    @image.when_tapped do
      open HomeMenuScreen, modal: true, animated: false
    end
  end
end
