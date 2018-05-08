RSpec.describe 'User' do
  describe 'Navigate from homepage to different paths' do
    it 'should take the user to merchants index' do
      visit('/')
      click_button('Merchants')

      expect(current_path).to eq('/merchants')
    end

    it 'should take the user to invoices index' do
      visit('/')
      click_button('Invoices')

      expect(current_path).to eq('/invoices')
    end

    it 'should take the user to items index' do
      visit('/')
      click_button('Items')

      expect(current_path).to eq('/items')
    end
  end

  describe 'Navigation from item index' do
    it 'should take the user to create a new item' do
      visit('/')
      click_button('Items')
      click_button('Create a New Item')

      expect(current_path).to eq('/items/new')
    end

    it 'should take the user to the dashboard' do
      visit('/')
      click_button('Items')
      click_link('Dashboard')

      expect(current_path).to eq('/items/dashboard')
    end

    it 'should take the user to the merchants index' do
      visit('/')
      click_button('Items')
      click_link('Merchants')

      expect(current_path).to eq('/merchants')
    end

    it 'should take the user to the invoices index' do
      visit('/')
      click_button('Items')
      click_link('Invoices')

      expect(current_path).to eq('/invoices')
    end

    it 'should take the user back to the homepage' do
      visit('/')
      click_button('Items')
      click_link('Little Shop')

      expect(current_path).to eq('/')
    end
  end

  describe 'Navigation from create item' do
    it 'should take the user to the merchants index' do
      visit('/')
      click_button('Items')
      click_button('Create a New Item')
      click_link('Merchants')

      expect(current_path).to eq('/merchants')
    end

    it 'should take the user to the items index' do
      visit('/')
      click_button('Items')
      click_button('Create a New Item')
      click_link('Item')

      expect(current_path).to eq('/items')
    end

    it 'should take the user to the invoices index' do
      visit('/')
      click_button('Items')
      click_button('Create a New Item')
      click_link('Invoices')

      expect(current_path).to eq('/invoices')
    end

    it 'should take the user back to the homepage' do
      visit('/')
      click_button('Items')
      click_button('Create a New Item')
      click_link('Little Shop')

      expect(current_path).to eq('/')
    end

    it 'should take the user back to the index on cancel' do
      visit('/')
      click_button('Items')
      click_button('Create a New Item')
      click_button('Cancel')

      expect(current_path).to eq('/items')
    end
  end

  describe 'Navigation from edit item' do
    it 'should take the user to the merchants index' do
      Merchant.create(name: "New Merchant", id: 5, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 2, merchant_id: 5, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 3, merchant_id: 6, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 4, merchant_id: 7, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

      visit('/')
      click_button('Items')
      first('#individual-item').click_on('Newer Thing')
      click_link('Merchants')

      expect(current_path).to eq('/merchants')
    end

    it 'should take the user to the items index' do
      Merchant.create(name: "New Merchant", id: 5, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 2, merchant_id: 5, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 3, merchant_id: 6, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 4, merchant_id: 7, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

      visit('/')
      click_button('Items')
      first('#individual-item').click_on('Newer Thing')
      click_link('Item')

      expect(current_path).to eq('/items')
    end

    it 'should take the user to the invoices index' do
      Merchant.create(name: "New Merchant", id: 5, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 2, merchant_id: 5, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 3, merchant_id: 6, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 4, merchant_id: 7, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

      visit('/')
      click_button('Items')
      first('#individual-item').click_on('Newer Thing')
      click_link('Invoices')

      expect(current_path).to eq('/invoices')
    end

    it 'should take the user back to the homepage' do
      Merchant.create(name: "New Merchant", id: 5, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 2, merchant_id: 5, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 3, merchant_id: 6, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 4, merchant_id: 7, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

      visit('/')
      click_button('Items')
      first('#individual-item').click_on('Newer Thing')
      click_link('Little Shop')

      expect(current_path).to eq('/')
    end

    it 'should take the user to the edit page after clicking on edit' do
      Merchant.create(name: "New Merchant", id: 5, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 2, merchant_id: 5, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 3, merchant_id: 6, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 4, merchant_id: 7, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

      visit('/')
      click_button('Items')
      first('#individual-item').click_on('Newer Thing')
      click_button('Edit')

      expect(current_path).to eq('/items/1/edit')
    end

    it 'should redirect user to index page after delete' do
      Merchant.create(name: "New Merchant", id: 5, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 2, merchant_id: 5, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 3, merchant_id: 6, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
      Item.create(item_id: 4, merchant_id: 7, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

      visit('/')
      click_button('Items')
      first('#individual-item').click_on('Newer Thing')
      click_button('Delete')

      expect(current_path).to eq('/items')
    end
  end
end