require './spec/spec_helper'
RSpec.describe Invoice do
  describe 'validations' do
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

  describe 'Class Methods' do
    describe '.update' do
      it 'updates an existing invoice' do
        Invoice.create(
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
        Invoice.create(
          id: 1,
          customer_id: 1,
          merchant_id: 300,
          status: 'pending',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )
        Invoice.delete(1)

        expect(Invoice.find_by_id(1)).to be_nil
      end
    end

    describe '.total_count' do
      it 'should count all invoice' do
        Invoice.create(
          id: 1,
          customer_id: 1,
          merchant_id: 300,
          status: 'pending',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )
        value = 1

        expect(Invoice.total_count).to eq(value)
      end
    end

    describe '.pending_percent' do
      it 'should return percent of all invoices that are pending invoices' do
        Invoice.create(
          id: 1,
          customer_id: 1,
          merchant_id: 300,
          status: 'pending',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )
        Invoice.create(
          id: 2,
          customer_id: 1,
          merchant_id: 300,
          status: 'shipped',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )
        value_p = 50
  
        expect(Invoice.pending_percent).to eq(value_p)
      end
    end
  
    describe '.shipped_percent' do
      it 'should return percent of all invoices that are shipped invoices' do
        Invoice.create(
          id: 1,
          customer_id: 1,
          merchant_id: 300,
          status: 'pending',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )
        Invoice.create(
          id: 2,
          customer_id: 1,
          merchant_id: 300,
          status: 'shipped',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )
        value_s = 50
  
        expect(Invoice.shipped_percent).to eq(value_s)
      end
    end
  
    describe '.returned_percent' do
      it 'should return percent of all invoice that are returned invoices' do
        Invoice.create(
          id: 1,
          customer_id: 1,
          merchant_id: 300,
          status: 'returned',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )
        Invoice.create(
          id: 2,
          customer_id: 1,
          merchant_id: 300,
          status: 'shipped',
          created_at: '2009-02-07',
          updated_at: '2014-03-15'
        )
        value_r = 50
  
        expect(Invoice.returned_percent).to eq(value_r)
      end
    end
  end
end
