class Collectible
  def self.all
    [{
      name: "Linkin Park",
    }, {
      name: "Metallica",
    }, {
      name: "Fun",
    }, {
      name: "311",
    }].map{ |options| new(options) }
  end

  attr_accessor :name

  def initialize(options = {})
    options.each do |field, value|
      __send__("#{field}=", value)
    end
  end

  def artistImage
    "collectible/bg_collection_#{name.downcase.gsub(/\ +/, "_")}".uiimage
  end

  def imageURL
    # artistImage
    @image ||= "http://aries.neusis.com:9292/orders/1-signed.jpg".nsurl
  end

  def audioURL
    @audio ||= "http://aries.neusis.com:9292/orders/1.caf".nsurl
  end
end
