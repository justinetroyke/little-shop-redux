require 'csv'
require File.expand_path("../../config/environment", __FILE__)

merchants = CSV.open('./data/merchants.csv',
                     headers: true,
                     header_converters: :symbol)
merchants.each do |merchant|
  Merchant.create(merchant_id:  merchant[:id],
                  name:         merchant[:name],
                  created_at:   merchant[:created_at],
                  updated_at:   merchant[:updated_at])
end

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
