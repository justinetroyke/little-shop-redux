RSpec.describe 'User updates invoice' do
  it 'should delete the invoice and show invoice index' do
    Invoice.create(
      id: 2134,
      customer_id: 1,
      merchant_id: 300,
      status: 'pending',
      created_at: '2009-02-07',
      updated_at: '2014-03-15'
    )
    visit './invoices/2134'
    click_button('Delete')

    invoice = Invoice.find(2134)
    expect(current_path).to eq('/invoices')
    expect(page).to_not have_content('2134')
  end
end
