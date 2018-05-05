RSpec.describe 'visitors' do
  it 'should show me merchants header ' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    expect(page).to have_content('Merchants')
  end

  it 'should show all the merchants ' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    expect(page).to have_content('walmart')
  end

  it 'should take me to merchant home page when i click marchants ' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Merchants')

    expect(current_path).to eq('/merchants')
  end

  # it 'should take me to items home page when i click items ' do
  #   merchant = Merchant.create(name: 'walmart')
  #   visit('/merchants')
  #
  #   click_link('Items')
  #
  #   expect(current_path).to eq('/items')
  # end

  it 'should take me to invoices home page when i click invoices ' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Invoices')

    expect(current_path).to eq('/invoices')
  end

  it 'should take me to home page when i click Little shop ' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Little Shop')

    expect(current_path).to eq('/')
  end

  it 'should take me to merchant/new page when i click create new merchant ' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    click_button('Create A New Merchant')

    expect(current_path).to eq('/merchants/new')
  end

  it 'should take me to edit page when i  edit' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Edit')

    expect(current_path).to eq("/merchants/#{merchant.id}/edit")
  end

  it 'should take me to home page when i  click delete' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    click_button('Delete')

    expect(current_path).to eq("/merchants")
  end

  it 'should take me to dashboard page when i  click dashboard' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link('Dashboard')

    expect(current_path).to eq("/merchants-dashboard")
  end

  it 'should take me to individual merchant page when i  click merchant name' do
    merchant = Merchant.create(name: 'walmart')
    visit('/merchants')

    click_link("#{merchant.name}")

    expect(current_path).to eq("/merchants/#{merchant.id}")
  end
end
