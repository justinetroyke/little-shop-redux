RSpec.describe 'visitors' do
  it 'shows a create new page' do
    merchant = Merchant.create(name: 'walmart')

    visit('/merchants/new')

    expect(page).to have_content("Invoices")
    expect(page).to have_content("Merchants")
    expect(page).to have_content("Items")
    expect(page).to have_content("Little Shop")
    expect(page).to have_content("Create New Merchant")
    expect(page).to have_content("Name")
    expect(page).to have_content("Cancel")
  end

  it 'should redirect me to merchants home page when i click merchants' do
    merchant = Merchant.create(name: 'walmart')

    visit('/merchants/new')

    click_link("Merchants")

    expect(current_path).to eq("/merchants")
  end

  it 'should redirect me to invoices home page when i click invoices' do
    merchant = Merchant.create(name: 'walmart')

    visit('/merchants/new')

    click_link("Invoices")

    expect(current_path).to eq("/invoices")
  end
  # it 'should redirect me to items home page when i click items' do
  #   merchant = Merchant.create(name: 'walmart')
  #
  #   visit('/merchants/new')
  #
  #   click_link("Items")
  #
  #   expect(current_path).to eq("/items")
  # end

  it 'should redirect me to home page when i click little shop' do
    merchant = Merchant.create(name: 'walmart')

    visit('/merchants/new')

    click_link("Little Shop")

    expect(current_path).to eq("/")
  end

  it 'should redirect me to home page when i click cancel' do
    merchant = Merchant.create(name: 'walmart')

    visit('/merchants/new')

    click_link("Cancel")

    expect(current_path).to eq("/")
  end

  it 'should redirect me to individual merchant page when i click create merchant' do
    merchant = Merchant.create(name: 'walmart')

    visit('/merchants/new')
    fill_in("merchant[name]", :with => 'Manoj')
    click_button("Create Merchant")

    expect(current_path).to eq("/merchants/2")
  end
end
