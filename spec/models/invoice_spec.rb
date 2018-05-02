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
    end
  end
end
