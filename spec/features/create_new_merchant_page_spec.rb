RSpec.describe 'visitors' do
  it ' should be  see a create new page' do
    Merchant.create(name: 'walmart')

    visit('/merchants/new')

    expect(page).to have_content('Invoices')
    expect(page).to have_content('Merchants')
    expect(page).to have_content('Items')
    expect(page).to have_content('Little Shop')
    expect(page).to have_content('Create New Merchant')
    expect(page).to have_content('Name')
    expect(page).to have_content('Cancel')
  end

  it 'should be redirected to merchants home page when they click merchants' do
    Merchant.create(name: 'walmart')

    visit('/merchants/new')

    click_link('Merchants')

    expect(current_path).to eq('/merchants')
  end

  it 'should be redirected  to invoices home page when they click invoices' do
    Merchant.create(name: 'walmart')

    visit('/merchants/new')

    click_link('Invoices')

    expect(current_path).to eq('/invoices')
  end

  it 'should be redirected me to items home page when they click items' do
    Merchant.create(name: 'walmart')

    visit('/merchants/new')

    click_link('Items')

    expect(current_path).to eq('/items')
  end

  it 'should be redirected to home page when they click little shop' do
    Merchant.create(name: 'walmart')

    visit('/merchants/new')

    click_link('Little Shop')

    expect(current_path).to eq('/')
  end

  it 'should be redirected to home page when they click cancel' do
    Merchant.create(name: 'walmart')

    visit('/merchants/new')

    click_link('Cancel')

    expect(current_path).to eq('/merchants')
  end

  it 'should be redirected to individual merchant page when they click create merchant' do
    visit('/merchants/new')
    fill_in('merchant[name]', :with => 'walmart')
    click_button('Create Merchant')

    merchant = Merchant.all.last

    expect(current_path).to eq("/merchants/#{merchant.id}")
    expect(page).to have_content(merchant.name)
  end
end
