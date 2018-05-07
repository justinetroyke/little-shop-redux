RSpec.describe 'User' do
  it 'should see the secondary header for the item index page' do
    item_index_header = "Items"
    visit('/items')

    within('header') do
      expect(page).to have_content(item_index_header)
    end
  end

  it 'should see the first item in the list' do
    Item.create(item_id: 2, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
    Item.create(item_id: 3, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
    Item.create(item_id: 4, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

    first_item_name = 'Newer Thing'
    visit('/items')

    expect(page).to have_content(first_item_name)
  end
end
