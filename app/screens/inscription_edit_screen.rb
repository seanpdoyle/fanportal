class InscriptionEditScreen < OrderFormScreen
  title "Add Inscription"

  def table_data
    {
      sections: [{
        title: "Write an inscription for your autograph",
        rows: [{
          key: :inscription,
          type: :text,
          auto_capitalization: :none,
          row_height: 200
        }]
      }]
    }
  end

  def on_submit(_form)
    data = _form.render
    order.inscription = data[:inscription]
  end
end
