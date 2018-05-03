require 'csv'

items = CSV.open('./data/items.csv',
                 headers: true,
                 header_converters: :symbol)
items.each do |item|
  Item.create(item_id:      item[:id],
              name:         item[:name],
              description:  item[:description],
              unit_price:   item[:unit_price],
              image:        'https://i.imgur.com/iXHefKS.png',
              created_at:   item[:created_at],
              updated_at:   item[:updated_at])
end
