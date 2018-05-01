merchants = CSV.open('./data/merchants.csv') headers: true
merchants.each do |merchant|
  require "pry"; binding.pry
  Merchant.create()
end
