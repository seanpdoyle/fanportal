class ArtistCard < UIView
  include PM::Styling

  IMAGE_HEIGHT  = 140
  TEXT_HEIGHT   = 30
  WIDTH         = 300
  HEIGHT        = IMAGE_HEIGHT + TEXT_HEIGHT

  attr_accessor :collectible

  def initialize(options = {})
    options.each do |field, value|
      self.__send__("#{field}=", value)
    end
  end

  def initWithFrame(frame)
    super(frame)

    @image = UIImageView.alloc.initWithFrame([[0,0], [WIDTH, IMAGE_HEIGHT]])
    set_attributes @image,
      image: collectible.artistImage,
      contentMode: UIViewContentModeTop,
      clipsToBounds: true
    self.addSubview(@image)

    @name  = UILabel.alloc.initWithFrame([[0, IMAGE_HEIGHT], [WIDTH, TEXT_HEIGHT]])
    set_attributes @name,
      text: collectible.name,
      textColor: "#333333".uicolor,
      textAlignment: NSTextAlignmentCenter,
      font: UIFont.fontWithName('AvenirNext-DemiBold', size: 12)
    self.addSubview(@name)

    set_attributes self,
      backgroundColor: :white.uicolor,
      layer: {
        masksToBounds: true,
        cornerRadius: 2,
        borderColor: "#c8c8c8".uicolor.CGColor,
        borderWidth: 0.5,
        shadow_opacity: 0.15,
        # shadow_offset: 0.5,
        shadow_angle: 90,
        shadow_color: "#010202".uicolor.CGColor
      }
  end
end
