class InscriptionEditScreen < OrderFormScreen
  title "Add Inscription"

  def maximumCharacterCount
    80
  end

  def promptText
    "Write an inscription for your autograph"
  end

  def fieldName
    :inscription
  end
end
