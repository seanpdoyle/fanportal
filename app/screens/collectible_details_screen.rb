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
    @image      = subview GVPhotoBrowser, :image, delegate: self, dataSource: self
    @close      = subview UIButton, :close
    @playButton = subview UIButton, :play_button
  end

  def will_appear
    self.view.bringSubviewToFront(@close)
    self.view.bringSubviewToFront(@playButton)

    @image.start
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

  def numberOfPhotosInPhotoBrowser(photoBrowser)
    1
  end

  def photoBrowser(photoBrowser, customizeImageView:imageView, forIndex:index)
    imageView.setImageWithURL(collectible.imageURL)
    imageView
  end

  def photoBrowser(photoBrowser, didSwitchToIndex:index)
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
