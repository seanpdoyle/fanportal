class CollectibleDetailsScreen < PM::Screen
  attr_accessor :collectible

  stylesheet :collectible_details

  layout :root do
    @close      = subview UIButton, :close
    @image      = subview ZoomRotatePanImageView, :image
    @playButton = subview UIButton, :play
  end

  def will_appear
    @image.image = collectible.image
    @image.reset
    @close.on_tap do
      close
    end
  end
end
