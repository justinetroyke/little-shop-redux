RSpec.describe 'visitors' do

  it 'should see navigation bar ' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

    expect(page).to have_content('Merchants')
    expect(page).to have_content('Invoices')
    expect(page).to have_content('Items')
    expect(page).to have_content('Little Shop')
    expect(page).to have_content(merchant.name)
    expect(page).to have_content('Edit')
    expect(page).to have_content('Delete')
  end

  it 'should be taken to merchant home page when i click marchants ' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

    click_link('Merchants')

    expect(current_path).to eq('/merchants')
  end

  it 'should be taken to items home page when i click items ' do
    Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Items')

    expect(current_path).to eq('/items')
  end

  it 'should be taken to invoices home page when i click invoices ' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

    click_link('Invoices')

    expect(current_path).to eq('/invoices')
  end

  it 'should be taken to home page when i click Little shop ' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

    click_link('Little Shop')

    expect(current_path).to eq('/')
  end

  it 'should be  taken  to edit page when i click  edit' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

    click_button('Edit')

    expect(current_path).to eq('/merchants/1')
  end

  it 'should be taken to merchants home page when i  click delete' do
    merchant = Merchant.create(name: 'walmart')
    merchant.items.create(name: 'pancake', description: 'tates good', unit_price: 100)
    visit("/merchants/#{merchant.id}")

    click_button('Delete')

    expect(current_path).to eq('/merchants')
  end

  it 'should show me attributes of merchant' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

    expect(page).to have_content(merchant.name)
  end

  it 'should show me items of a  merchant' do
    merchant = Merchant.create(name: 'walmart')
    item = Item.create!(image: 'bajhcbka', merchant_id: merchant.id, name: 'pancake', description: 'tates good', unit_price: 100)

    visit("/merchants/#{merchant.id}")

    expect(page).to have_content(item.name)
    expect(page).to have_content(item.unit_price)
  end
end
