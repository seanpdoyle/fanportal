class CollectibleDetailsScreen < PM::Screen
  attr_accessor :collectible

  stylesheet :collectible_details

  layout :root do
    @close      = subview UIButton, :close
    @image      = subview ZoomRotatePanImageView, :image
    @playButton = subview UIButton, :play_button
  end

  def will_appear
    @image.image = collectible.image
    @image.reset

    @close.on_tap do
      close
    end

    @playButton.on_tap do
      togglePlayButton
      1.second.later do
        togglePlayButton
      end
    end
  end

  private

  def togglePlayButton
    if stopped?
      @playButton.setTitle("PLAY RECORDING", forState: UIControlStateNormal)
      @playButton.setTitleColor("#59db97".uicolor, forState: UIControlStateNormal)
    else
      @playButton.setTitle("STOP", forState: UIControlStateNormal)
      @playButton.setTitleColor("#f5725a".uicolor, forState: UIControlStateNormal)
    end
  end

  def stopped?
    @playButton.titleLabel.text.to_s.downcase == "stop"
  end
end
