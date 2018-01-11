def up
  create_table id: false do
  end

  foreign_key(:line_items, :product_id, :products)
  foreign_key(:line_items, :oreder_id, :orders)
end

