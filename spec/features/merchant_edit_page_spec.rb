RSpec.describe 'visitors' do
  it 'should show me edit home page' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    expect(page).to have_content("Edit #{merchant.name}")
    expect(page).to have_content("Name")
  end

  it 'should take  me to merchants home page when i click merchants' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    click_link("Merchants")

    expect(current_path).to eq("/merchants")
  end

  it 'should take  me to invoices home page when i click invoices' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    click_link("Invoices")

    expect(current_path).to eq("/invoices")
  end

  # it 'should take  me to items home page when i click items' do
  #   merchant = Merchant.create(name: 'walmart')
  #   visit("/merchants/#{merchant.id}/edit")
  #
  #   click_link("Items")
  #
  #   expect(current_path).to eq("/items")
  # end
  it 'should take  me to home page when i click cancel' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    click_link("Cancel")

    expect(current_path).to eq("/")
  end

  it 'should take me to individual merchant page when i click update merchant' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}/edit")

    click_button("Update Merchant")

    expect(current_path).to eq("/merchants/#{merchant.id}")
  end
end
