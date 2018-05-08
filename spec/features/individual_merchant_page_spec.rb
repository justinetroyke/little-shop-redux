RSpec.describe 'visitors' do

  it 'should show me navigation bar ' do
    merchant = Merchant.create(name: 'walmart')
    merchant.items.create(name: 'pancake', description: 'tates good', unit_price: 100)
    visit("/merchants/#{merchant.id}")

    expect(page).to have_content("#{merchant.name}")
  end

  it 'should take me to merchant home page when i click marchants ' do
    merchant = Merchant.create(name: 'walmart')
    merchant.items.create(name: 'pancake', description: 'tates good', unit_price: 100)
    visit("/merchants/#{merchant.id}")

    click_link('Merchants')

    expect(current_path).to eq('/merchants')
  end

  # it 'should take me to items home page when i click items ' do
  #   merchant = Merchant.create(name: 'walmart')
  # merchant.items.create(name: 'pancake', description: 'tates good', unit_price: 100)
  #   visit('/merchants')
  #
  #   click_link('Items')
  #
  #   expect(current_path).to eq('/items')
  # end

  it 'should take me to invoices home page when i click invoices ' do
    merchant = Merchant.create(name: 'walmart')
    merchant.items.create(name: 'pancake', description: 'tates good', unit_price: 100)
    visit("/merchants/#{merchant.id}")

    click_link('Invoices')

    expect(current_path).to eq('/invoices')
  end

  it 'should take me to home page when i click Little shop ' do
    merchant = Merchant.create(name: 'walmart')
    merchant.items.create(name: 'pancake', description: 'tates good', unit_price: 100)
    visit("/merchants/#{merchant.id}")

    click_link('Little Shop')

    expect(current_path).to eq('/')
  end

  it 'should take me to edit page when i click  edit' do
    merchant = Merchant.create(name: 'walmart')
    merchant.items.create(name: 'pancake', description: 'tates good', unit_price: 100)
    visit("/merchants/#{merchant.id}")

    click_button('Edit')

    expect(current_path).to eq("/merchants/1")
  end

  it 'should take me to home page when i  click delete' do
    merchant = Merchant.create(name: 'walmart')
    merchant.items.create(name: 'pancake', description: 'tates good', unit_price: 100)
    visit("/merchants/#{merchant.id}")

    click_button('Delete')

    expect(current_path).to eq("/merchants")
  end

  it 'should show me attributes of  merchant' do
    merchant = Merchant.create(name: 'walmart' )
    merchant.items.create(name: 'pancake', description: 'tates good', unit_price: 100)
    visit("/merchants/#{merchant.id}")


    expect(page).to have_content("#{merchant.name}")
  end

  it 'should show me items of a  merchant' do
    merchant = Merchant.create(name: 'Nepal')
    merchant.items.create(name: 'pancake', description: 'tates good', unit_price: 100)
    visit("/merchants/#{merchant.id}")
  end
end
