class MessageEditScreen < OrderFormScreen

  title "Add Message"

  def table_data
    {
      sections: [{
        title: "Write a personal message to #{order.artistName}",
        rows: [{
          key: :message,
          type: :text,
          auto_capitalization: :none,
          row_height: 200
        }]
      }]
    }
  end

  def on_submit(_form)
    data = _form.render
    order.message = data[:message]
  end
end
