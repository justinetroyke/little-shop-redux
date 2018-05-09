RSpec.describe 'visitors' do
  describe 'should see' do
    it 'merchants dashboard' do
      merchant = Merchant.create(name: 'walmart')
      Item.create(image: 'manjnk',
                  merchant_id: merchant.id,
                  name: 'pancake',
                  description: 'tates good',
                  unit_price: 100)
      visit('/merchants-dashboard')

      expect(page).to have_content('Little Shop')
      expect(page).to have_content('Invoices')
      expect(page).to have_content('Merchants')
      expect(page).to have_content('Items')
      expect(page).to have_content(merchant.name)
      expect(page).to have_content('Merchants Dashboard')
      expect(page).to have_content('Merchant with Highest Price Item:')
      expect(page).to have_content('Merchant with Highest Price Item:')
      expect(page).to have_content('Item Count:')
      expect(page).to have_content('Avg Item Price:')
      expect(page).to have_content('Total Cost of Items:')
    end
  end

  describe 'clicking LittleShop' do
    it 'should see home page' do
      merchant = Merchant.create(name: 'walmart')
      Item.create!(image: 'manjnkj',
                   merchant_id: merchant.id,
                   name: 'pancake',
                   description: 'tates good',
                   unit_price: 100)
      visit('/merchants-dashboard')

      click_link('Little Shop')

      expect(current_path).to eq('/')
    end
  end
  describe 'clicking Invoices' do
    it 'should see invoices home page' do
      merchant = Merchant.create(name: 'walmart')
      Item.create!(image: 'manjnkj',
                   merchant_id: merchant.id,
                   name: 'pancake',
                   description: 'tates good',
                   unit_price: 100)
      visit('/merchants-dashboard')

      click_link('Invoices')

      expect(current_path).to eq('/invoices')
    end
  end

  describe 'clicking Merchants' do
    it 'should see merchants home page' do
      merchant = Merchant.create(name: 'walmart')
      Item.create!(image: 'manjnkj',
                   merchant_id: merchant.id,
                   name: 'pancake',
                   description: 'tates good',
                   unit_price: 100)
      visit('/merchants-dashboard')

      click_link('Merchants')

      expect(current_path).to eq('/merchants')
    end
  end

  describe 'clicking Items' do
    it 'should see items home page' do
      merchant = Merchant.create(name: 'walmart')
      Item.create!(image: 'manjnkj',
                   merchant_id: merchant.id,
                   name: 'pancake',
                   description: 'tates good',
                   unit_price: 100)
      visit('/merchants-dashboard')

      click_link('Items')

      expect(current_path).to eq('/items')
    end
  end

  describe 'clicking on merchant with highest price item' do
    it 'should be redirected to individual merchant page' do
      merchant = Merchant.create(name: 'walmart')
      Item.create!(image: 'manjnkj',
                   merchant_id: merchant.id,
                   name: 'pancake',
                   description: 'tates good',
                   unit_price: 100)
      visit('/merchants-dashboard')

      within find('.top-merchant') do
        click_link(merchant.name)
      end

      expect(current_path).to eq("/merchants/#{merchant.id}")
    end
  end

  describe 'clicking on merchant with most items' do
    it 'should be redirected to individual merchant page' do
      merchant = Merchant.create(name: 'walmart')
      Item.create!(image: 'manjnkj',
                   merchant_id: merchant.id,
                   name: 'pancake',
                   description: 'tates good',
                   unit_price: 100)
      visit('/merchants-dashboard')

      within find('.top-revenue') do
        click_link(merchant.name)
      end

      expect(current_path).to eq("/merchants/#{merchant.id}")
    end
  end

  describe 'looking int merchant box ' do
    it 'should see merchants item details ' do
      merchant = Merchant.create(name: 'walmart')
      Item.create!(image: 'manjnkj',
                   merchant_id: merchant.id,
                   name: 'pancake',
                   description: 'tates good',
                   unit_price: 100)
      visit('/merchants-dashboard')
      item_count = 1
      avg_item_price = (item.unit_price / item_count) / 100
      total_cost_of_items = item.unit_price / 100

      expect(page).to have_content(item_count)
      expect(page).to have_content(avg_item_price)
      expect(page).to have_content(total_cost_of_items)
    end
  end

  describe 'clicking on merchant name inside merchant box' do
    it 'should be redirected to individual merchant page' do
      merchant = Merchant.create(name: 'walmart')
      Item.create!(image: 'manjnkj',
                   merchant_id: merchant.id,
                   name: 'pancake',
                   description: 'tates good',
                   unit_price: 100)
      visit('/merchants-dashboard')

      within find('.merchant-div') do
        click_link(merchant.name)
      end

      expect(current_path).to eq("/merchants/#{merchant.id}")
    end
  end
end
