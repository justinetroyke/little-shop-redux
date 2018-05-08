RSpec.describe 'User updates invoice' do
  it 'should see invoice edit header' do
    Invoice.create(
      id: 2134,
      customer_id: 1,
      merchant_id: 300,
      status: 'pending',
      created_at: '2009-02-07',
      updated_at: '2014-03-15'
    )
    visit '/invoices/2134/edit'

    expect(page).to have_content 'Invoice:'
  end

  it 'should see invoice number and status' do
    invoice = Invoice.create(
      id: 2134,
      customer_id: 1,
      merchant_id: 300,
      status: 'pending',
      created_at: '2009-02-07',
      updated_at: '2014-03-15'
    )
    visit '/invoices/2134/edit'

    expect(page).to have_content(invoice.id)
    expect(page).to have_content(invoice.status)
  end

  it 'should see cancel and update invoice option' do
    invoice = Invoice.create(
      id: 2134,
      customer_id: 1,
      merchant_id: 300,
      status: 'pending',
      created_at: '2009-02-07',
      updated_at: '2014-03-15'
    )
    visit '/invoices/2134/edit'

    expect(page).to have_button('Cancel')
    expect(page).to have_button('Update Invoice')
  end

  it 'should update the invoice and show on invoice page' do
    invoice = Invoice.create(
      id: 2134,
      customer_id: 1,
      merchant_id: 300,
      status: 'pending',
      created_at: '2009-02-07',
      updated_at: '2014-03-15'
    )
    fill_in('status: 'shipped'}
    click_button('Update Invoice')

    expect(invoice.status).to eq('shipped')
  end
end
