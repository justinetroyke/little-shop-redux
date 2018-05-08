require './spec/spec_helper'
RSpec.describe Merchant do
  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if missing a name' do
        merchant = Merchant.new(
          id: 123213,
          created_at: "2002-11-18 00:00:00",
          updated_at: "2007-10-09 00:00:00"
        )
      end
    end
  end

  describe 'can calculate' do
    it 'average item price' do
      merchant = Merchant.create(name: 'walmart')
      Item.create!(name: 'tool',
                  merchant: merchant,
                  description: 'this is cool',
                  unit_price: 1200,
                  image: "writemoartests")
      expect(Merchant.avg_item_price).to eq(10)
    end
  end
end
