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

  attr_accessor :artistName, :message, :inscription, :image

  def initialize(options = {})
    options.each do |field, value|
      __send__("#{field}=", value)
    end
  end

  def submit(&block)
    data = { payload: fields }

    unless image.nil?
      data[:files] = {photo: photo}
    end

    BW::HTTP.post(ENDPOINT, data) do |response|
      if response.ok?
        block.call unless block.nil?
      else
        puts response
      end
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

  def fields
    {
      message:       message.to_s.strip,
      inscription:   inscription.to_s.strip,
      device_token:  self.class.deviceToken.to_s.strip
    }
  end

  def photo
    {
      data: image.nsdata,
      filename: "order-image.png",
      content_type: "image/png"
    }
  end
end
