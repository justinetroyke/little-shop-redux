require 'csv'
require File.expand_path("../../config/environment", __FILE__)

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
