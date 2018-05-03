require 'csv'
require 'database_cleaner'
require File.expand_path("../../config/environment", __FILE__)

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

invoices = CSV.open('./data/invoices.csv',
                     headers: true,
                     header_converters: :symbol)
invoices.each do |invoice|
  Invoice.create(
    id:             invoice[:id],
    customer_id:    invoice[:customer_id],
    merchant_id:    invoice[:merchant_id],
    status:         invoice[:status],
    created_at:     invoice[:created_at],
    updated_at:     invoice[:updated_at]
  )
end

items = CSV.open('./data/items.csv',
                 headers: true,
                 header_converters: :symbol)
items.each do |item|
  Item.create(item_id:      item[:id],
              name:         item[:name],
              description:  item[:description],
              unit_price:   item[:unit_price],
              image:        'https://icdn4.digitaltrends.com/image/tinder-dating-app-couple-laughing-smart-phone-embarass-bryson-and-kate-loling-at-u-720x720.jpg?ver=1.jpg',
              created_at:   item[:created_at],
              updated_at:   item[:updated_at])
end

merchants = CSV.open('./data/merchants.csv',
                     headers: true,
                     header_converters: :symbol)
merchants.each do |merchant|
  Merchant.create(merchant_id:  merchant[:id],
                  name:         merchant[:name],
                  created_at:   merchant[:created_at],
                  updated_at:   merchant[:updated_at])
end
