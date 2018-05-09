# RSpec.describe 'User' do
#   describe 'items dashboard' do
#     it 'should see correct informatino' do
#       Merchant.create(name: "New Merchant", id: 5, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
#       Item.create(item_id: 2, merchant_id: 5, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
#       Item.create(item_id: 3, merchant_id: 6, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
#       Item.create(item_id: 4, merchant_id: 7, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

#       visit('/')
#       click_link('')