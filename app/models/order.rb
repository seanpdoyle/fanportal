class Order
  attr_accessor :artistName, :message, :inscription

  def initialize(options = {})
    options.each do |field, value|
      __send__("#{field}=", value)
    end
  end

  def []=(field, value)
    __send__("#{field}=", value)
  end

  def messageRow
    Message.new(self)
  end

  def inscriptionRow
    Inscription.new(self)
  end
end
