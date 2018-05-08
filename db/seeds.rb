require 'csv'
require 'database_cleaner'
require File.expand_path('../config/environment', __dir__)

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
  Item.create(id:           item[:id],
              name:         item[:name],
              description:  item[:description],
              unit_price:   item[:unit_price],
              merchant_id:  item[:merchant_id],
              image:        'https://icdn4.digitaltrends.com/image/tinder-dating-app-couple-laughing-smart-phone-embarass-bryson-and-kate-loling-at-u-720x720.jpg?ver=1.jpg',
              created_at:   item[:created_at],
              updated_at:   item[:updated_at])
end

merchants = CSV.open('./data/merchants.csv',
                     headers: true,
                     header_converters: :symbol)
merchants.each do |merchant|
  Merchant.create(id:           merchant[:id],
                  name:         merchant[:name],
                  created_at:   merchant[:created_at],
                  image:        'https://icdn4.digitaltrends.com/image/tinder-dating-app-couple-laughing-smart-phone-embarass-bryson-and-kate-loling-at-u-720x720.jpg?ver=1.jpg',
                  updated_at:   merchant[:updated_at])
end

invoice_items = CSV.open('./data/invoice_items.csv',
                         headers: true,
                         header_converters: :symbol)
invoice_items.each do |invoice_item|
  InvoiceItem.create(item_id:    invoice_item[:item_id],
                      invoice_id: invoice_item[:invoice_id],
                      quantity:   invoice_item[:quantity],
                      unit_price: invoice_item[:unit_price],
                      updated_at: invoice_item[:updated_at],
                      created_at: invoice_item[:created_at])
  end
