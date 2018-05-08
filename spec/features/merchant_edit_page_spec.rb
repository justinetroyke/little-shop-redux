RSpec.describe 'visitors' do
  it 'should see edit home page' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    expect(page).to have_content("Edit #{merchant.name}")
    expect(page).to have_content('Name')
    expect(page).to have_content('Invoices')
    expect(page).to have_content('Merchants')
    expect(page).to have_content('Items')
    expect(page).to have_content('Little Shop')
    expect(page).to have_content('Cancel')
  end

  it 'should be taken to merchants home page when they click merchants' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    click_link('Merchants')

    expect(current_path).to eq('/merchants')
  end

  it 'should be  taken to invoices home page when they click invoices' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    click_link('Invoices')

    expect(current_path).to eq('/invoices')
  end

  it 'should be taken to items home page when tehy click items' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    click_link('Items')

    expect(current_path).to eq('/items')
  end

  it 'should be taken to home page when they click cancel' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    click_link('Cancel')

    expect(current_path).to eq('/merchants')
  end


  it 'should be taken to individual merchant page when they click update merchant' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    click_button('Update Merchant')

    expect(current_path).to eq("/merchants/#{merchant.id}")
  end

  it 'should see new name they enter on individual merchant page when they click update merchant with new name' do
    merchant = Merchant.create(name: 'kingsooper')
    visit("/merchants/#{merchant.id}/edit")

    fill_in('merchant[name]', :with => 'walmart')
    click_button('Update Merchant')

    expect(current_path).to eq("/merchants/#{merchant.id}")
    expect(page).to have_content("walmart")
  end

  it 'should see same merchant name on individual page when no new name is provided' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    click_button('Update Merchant')

    expect(current_path).to eq("/merchants/#{merchant.id}")
    expect(page).to have_content(merchant.name)
  end
end
