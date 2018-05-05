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
end
