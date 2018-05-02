require 'csv'
require './app/models/merchant.rb'
merchants = CSV.open('./data/merchants.csv',
                     headers: true,
                     header_converters: :symbol)
merchants.each do |merchant|
  Merchant.create(merchant_id:  merchant[:id],
                  name:         merchant[:name],
                  created_at:   merchant[:created_at],
                  updated_at:   merchant[:updated_at])
end

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
