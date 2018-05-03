RSpec.describe Merchant do
  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if missing a name' do
        merchant = Merchant.create(merchant_id: 123213, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

        expect(merchant).to_not be_valid
      end
    end
  end
end
