RSpec.describe 'visitors' do
  it 'should  see merchants header ' do
    Merchant.create(name: 'walmart')
    visit('/merchants')

    expect(page).to have_content('Merchants')
  end

  it 'should see all the merchants ' do
    Merchant.create(name: 'walmart')
    visit('/merchants')

    expect(page).to have_content('walmart')
  end

  it 'should be taken to merchant home page when they click marchants ' do
    Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Merchants')

    expect(current_path).to eq('/merchants')
  end

  it 'should be taken to items home page when they click items ' do
    Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Items')

    expect(current_path).to eq('/items')
  end

  it 'should be taken to invoices home page when they click invoices ' do
    Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Invoices')

    expect(current_path).to eq('/invoices')
  end

  it 'should be taken to home page when they click Little shop ' do
    Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Little Shop')

    expect(current_path).to eq('/')
  end

  it 'should be taken merchant/new page when they click create new merchant ' do
    Merchant.create(name: 'walmart')
    visit('/merchants')

    click_button('Create A New Merchant')

    expect(current_path).to eq('/merchants/new')
  end

  it 'should be taken to  edit page when they click edit for a merchant' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Edit')

    expect(current_path).to eq("/merchants/#{merchant.id}/edit")
  end

  it 'should be taken to mercahnts home page when they click delete' do
    Merchant.create(name: 'walmart')
    visit('/merchants')

    click_button('Delete')

    expect(current_path).to eq('/merchants')
  end

  it 'should be taken to  dashboard page when they click dashboard' do
    merchant = Merchant.create(name: 'walmart')
    Item.create!(image: 'manjnkj',
                 merchant_id: merchant.id,
                 name: 'pancake',
                 description: 'tates good',
                 unit_price: 100)
    visit('/merchants')

    click_link('Dashboard')

    expect(current_path).to eq('/merchants-dashboard')
  end

  it 'should be taken to  individual merchant page when they click on merchant name' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link("#{merchant.name}")

    expect(current_path).to eq("/merchants/#{merchant.id}")
  end
end
