RSpec.describe 'User' do
  describe 'Editing an item' do
    it 'can edit the name of an item' do
      Merchant.create(name: "New Merchant", id: 5, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 2, merchant_id: 5, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 3, merchant_id: 6, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 4, merchant_id: 7, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

      visit('/')
      click_button('Items')
      first('#individual-item').click_on('Newer Thing')
      click_button('Edit')

      expect(current_path).to eq('/items/1/edit')

      fill_in('item[name]', with: 'Jerky')
      fill_in('item[description]', with: 'Chewable')
      fill_in('item[unit_price]', with: 100)
      fill_in('item[image]', with: 'http://jerky')
      click_button('Edit Item')

      expect(page).to have_content('Jerky')
      expect(page).to_not have_content('New thing')
    end
  end

  describe 'Deleting an item' do
    it 'can delete an item' do
      Merchant.create(name: "New Merchant", id: 5, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 2, merchant_id: 5, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 3, merchant_id: 6, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 4, merchant_id: 7, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

      visit('/')
      click_button('Items')
      first('#individual-item').click_on('Newer Thing')
      click_button('Delete')

      expect(current_path).to eq('/items')

      expect(page).to_not have_content('Newer Thing')
      expect(page).to have_content('Nope')
      expect(page).to have_content('Go Away')
    end
  end

  describe 'Creating an item' do
    it 'can create an item' do
      Merchant.create(name: "New Merchant", id: 5, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

      visit('/')
      click_button('Items')
      click_button('Create a New Item')

      fill_in('item[name]', with: 'Jerky')
      fill_in('item[description]', with: 'Chewable')
      fill_in('item[unit_price]', with: 100)
      fill_in('item[image]', with: 'http://jerky')
      click_button('Create New Item')

      expect(current_path).to eq('/items/1')
      expect(page).to have_content('Jerky')
      expect(page).to_not have_content('New thing')
    end
  end
end
