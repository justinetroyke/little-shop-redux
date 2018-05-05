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
  end
end
