class CollectibleDetailsScreen < PM::Screen
  class NullPlayer
    attr_accessor :delegate

    def play
      unless delegate.nil?
        delegate.audioPlayerDidFinishPlaying(self, successfully:false)
      end
    end
  end

  attr_accessor :collectible

  stylesheet :collectible_details

  layout :root do
    @close      = subview UIButton, :close
    @image      = subview ZoomRotatePanImageView, :image
    @playButton = subview UIButton, :play_button
  end

  def will_appear
    @image.image = collectible.imageURL.nsdata.uiimage
    @image.reset

    @close.on_tap do
      if modal?
        close
      else
        open_root_screen HomeScreen
      end
    end

    @playButton.on_tap do
      playCollectibleAudio
    end
  end

  def playCollectibleAudio
    togglePlayButton
    audioClip.play
  end

  def audioPlayerDidFinishPlaying(player, successfully:wasSuccess)
    togglePlayButton
  end

  def audioPlayerDecodeErrorDidOccur(player, error:withError)
    puts withError.localizedDescription
  end

  private

  def audioClip
    @audioClip ||= begin
      error = Pointer.new(:object)
      player = AVAudioPlayer.alloc.initWithData(collectible.audioURL.nsdata,error:error) || NullPlayer.new
      if error = error.value
        puts error.localizedDescription
      end
      player.delegate = self
      player
    end
  end

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
