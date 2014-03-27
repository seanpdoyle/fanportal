class Order
  ENDPOINT = "http://aries.neusis.com:9292/v1/orders".freeze
  class << self
    def deviceToken=(token)
      @deviceToken = token
    end

    def deviceToken
      @deviceToken
    end
  end

  attr_accessor :artistName, :message, :inscription, :imageURL

  def initialize(options = {})
    options.each do |field, value|
      __send__("#{field}=", value)
    end
  end

  def withImage(&block)
    if imageURL.nil?
      block.call(nil)
    else
      MotionAL::Asset.find_by_url(imageURL) do |asset|
        image = UIImage.imageWithCGImage(asset.full_resolution_image)
        block.call(image) unless block.nil?
      end
    end
  end

  def submit(success, onFailure:failure)
    withImage do |image|
      data = { payload: fields }

      unless image.nil?
        data[:files] = {photo: photoWithImage(image)}
      end

      postToServer(data, success, failure)
    end
  end

  def []=(field, value)
    __send__("#{field}=", value)
  end

  def valid?
    !!message && !!inscription
  end

  def messageRow
    Message.new(self)
  end

  def inscriptionRow
    Inscription.new(self)
  end

  private

  def postToServer(data, success, failure)
    BW::HTTP.post(ENDPOINT, data) do |response|
      if response.ok?
        success.call unless success.nil?
      else
        puts response
        failure.call unless failure.nil?
      end
    end
  end

  def fields
    {
      message:       message.to_s.strip,
      inscription:   inscription.to_s.strip,
      device_token:  self.class.deviceToken.to_s.strip
    }
  end

  def photoWithImage(image)
    {
      data: image.nsdata,
      filename: "order-image.png",
      content_type: "image/png"
    }
  end
end
