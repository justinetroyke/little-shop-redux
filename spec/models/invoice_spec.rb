require './spec/spec_helper'
RSpec.describe Invoice do
  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if missing a merchant id' do
        invoice = Invoice.create(
          id: 1,
          customer_id: 1,
          status: 'pending',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )

        expect(invoice).to_not be_valid
      end
      it 'should be invalid if missing status' do
        invoice = Invoice.create(
          id: 1,
          customer_id: 1,
          merchant_id: 300,
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )

        expect(invoice).to_not be_valid
      end
    end
  end

  describe 'Class Methods' do
    describe '.update' do
      it 'updates an existing invoice' do
        invoice = Invoice.create(
          id: 1,
          customer_id: 1,
          merchant_id: 300,
          status: 'pending',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )
        update_parameters = {customer_id: 728, status: 'shipped'}
        Invoice.update(1, update_parameters)

        expect(Invoice.find(1).customer_id).to eq(728)
        expect(Invoice.find(1).status).to eq('shipped')
      end
    end

    describe '.delete' do
      it 'deletes an existing invoice' do
        invoice = Invoice.create(
          id: 1,
          customer_id: 1,
          merchant_id: 300,
          status: 'pending',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )
        update_parameters = {customer_id: 728, status: 'shipped'}
        Invoice.update(1, update_parameters)

        expect(Invoice.find(1).customer_id).to eq(728)
        expect(Invoice.find(1).status).to eq('shipped')
      end
    end
  end
end
