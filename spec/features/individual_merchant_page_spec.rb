RSpec.describe 'visitors' do

  it 'should show me navigation bar ' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

    expect(page).to have_content("#{merchant.name}")
  end

  it 'should take me to merchant home page when i click marchants ' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

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
    visit("/merchants/#{merchant.id}")

    click_link('Invoices')

    expect(current_path).to eq('/invoices')
  end

  it 'should take me to home page when i click Little shop ' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

    click_link('Little Shop')

    expect(current_path).to eq('/')
  end

  it 'should take me to edit page when i click  edit' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

    click_button('Edit')

    expect(current_path).to eq("/merchants/1")
  end

  it 'should take me to home page when i  click delete' do
    merchant = Merchant.create(name: 'walmart')
    visit("/merchants/#{merchant.id}")

    click_button('Delete')

    expect(current_path).to eq("/merchants")
  end

  it 'should show me attributes of  merchant' do
    merchant = Merchant.create(name: 'walmart' )
    visit("/merchants/#{merchant.id}")


    expect(page).to have_content("#{merchant.name}")
    expect(page).to have_content("created_at")
    expect(page).to have_content("updated_at")
    expect(page).to have_content("id")
  end


end
