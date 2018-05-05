RSpec.describe 'User visits index homepage' do
  it 'should see invoice header' do
    visit '/invoices'

    expect(page).to have_content 'Invoices'
  end

  it 'should see index of invoices' do
    invoice = Invoice.create(
      id: 1,
      customer_id: 1,
      merchant_id: 300,
      status: 'pending',
      created_at: '2009-02-07',
      updated_at: '2014-03-15'
    )
    visit('/invoices')

    expect(page).to have_content(invoice)
  end

  it 'should have little shop header with buttons on merchants and items' do
    visit('/invoices')
    click_button('Merchants')

    expect(current_path).to eq '/merchants'
  end
end

# context 'they click on edit invoice button' do
#     it 'they are redirected to /invoice/:id/edit' do
#       invoice = Invoice.create!(merchant_id: 1, status: 'shipping')
#       Merchant.create!(id: 1, name: 'Boaty McBoatface')
#       visit '/invoices'
#       click_link 'Edit'
#
#       expect(current_path).to eq "/invoices/#{invoice[:id]}/edit"
#     end
#   end
