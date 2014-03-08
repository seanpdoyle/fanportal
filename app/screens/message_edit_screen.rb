class MessageEditScreen < OrderFormScreen

  title "Add Message"

  def fieldName
    :message
  end

  def promptText
    "Write a personal message to #{order.artistName}"
  end
end
