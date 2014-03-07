class Inscription
  def initialize(order)
    @order = order
  end

  def title
    "Write an Inscription for your Autograph"
  end

  def subtitle
    @order.inscription || "What do you want #{@order.artistName} to write on your photo? Ex. \"Mike, Happy Birthday. Thanks for being our biggest fan!\""
  end

  def screen
    InscriptionEditScreen
  end
end
