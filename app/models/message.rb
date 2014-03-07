class Message
  def initialize(order)
    @order = order
  end

  def title
    "Write #{@order.artistName} a Message"
  end

  def subtitle
    @order.message || "Write a personal message to #{@order.artistName} that will be delivered with your order"
  end
end
