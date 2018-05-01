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
