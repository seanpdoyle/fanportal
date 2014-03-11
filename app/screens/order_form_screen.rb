class OrderFormScreen < PM::Screen
  stylesheet :order_form_screen

  attr_accessor :order

  layout :action do
    subview UILabel, :prompt, text: promptText
    @textField = subview UITextView, :text_field
  end

  def on_init
    set_nav_bar_button :right,
      title: "OK",
      action: :save

    set_nav_bar_button :left,
      title: "Cancel",
      action: :cancel
  end

  def will_appear
    @textField.becomeFirstResponder
  end

  def maximumCharacterCount
    140
  end

  def fieldName
    :text
  end

  def cancel
    close(fieldName => nil)
  end

  def save
    close(fieldName => @textField.text)
  end
end
