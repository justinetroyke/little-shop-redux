RSpec.describe 'User updates invoice' do
  it 'should see invoice header' do
    visit '/invoices'

    expect(page).to have_content 'Invoices'
  end

  it 'should see index of invoices' do
    invoice = Invoice.create(
      id: 2134,
      customer_id: 1,
      merchant_id: 300,
      status: 'pending',
      created_at: '2009-02-07',
      updated_at: '2014-03-15'
    )
    invoice_2 = Invoice.create(
      id: 4567,
      customer_id: 1,
      merchant_id: 300,
      status: 'pending',
      created_at: '2009-02-07',
      updated_at: '2014-03-15'
    )
    visit('/invoices')

    expect(page).to have_content(invoice.id)
    expect(page).to have_content(invoice_2.id)
  end

  it 'should have little shop header with buttons on merchants and items' do
    visit('/invoices')

    expect(page).to have_button('Merchants')
    expect(page).to have_button('Items')
  end
end

RSpec.describe 'User clicking on invoice id to invoice page' do
  it 'should see invoice status and ID' do
    invoice = Invoice.create(
      id: 2134,
      customer_id: 1,
      merchant_id: 300,
      status: 'pending',
      created_at: '2009-02-07',
      updated_at: '2014-03-15'
    )
    merchant = Merchant.create(id:234, name: 'Strawberry')
    visit "/invoices/#{invoice.id}"

    expect(page).to have_content "Item Id"
    expect(page).to have_content invoice.id
    expect(page).to have_content "Item Title"
  end
end
