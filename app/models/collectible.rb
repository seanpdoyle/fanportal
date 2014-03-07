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

  def image
    artistImage
  end

end
