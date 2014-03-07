class Order
  attr_accessor :artistName, :message, :inscription

  def messageRow
    Message.new(self)
  end

  def inscriptionRow
    Inscription.new(self)
  end
end
