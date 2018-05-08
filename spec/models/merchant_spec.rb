require './spec/spec_helper'
RSpec.describe Merchant do
  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if missing a name' do
        merchant = Merchant.create(id: 1,
                                  created_at: "2002-11-18 00:00:00",
                                  updated_at: "2007-10-09 00:00:00")
        expect(merchant).to_not be_valid
      end
    end
  end

  describe 'Class methods' do
    describe '.create' do
      it 'should create a new merchant' do
        m1 = Merchant.create(name: 'fake merchant',
                        created_at: "2002-11-18 00:00:00",
                        updated_at: "2007-10-09 00:00:00")

        expect(Merchant.all.length).to eq(1)
        expect(Merchant.all.first.created_at).to eq('2002-11-18 00:00:00.000000000 +0000')
        expect(Merchant.all.first.updated_at).to eq('2007-10-09 00:00:00.000000000 +0000')
        expect(Merchant.all.first.id).to eq(m1.id)
        expect(Merchant.all.first.name).to eq(m1.name)
      end
    end
  end

  describe '.update' do
    it 'updates an existing merchant' do
      m1 = Merchant.create(name: 'walmart')
      update_parameters = { id: 1,
                            name: "fake merchant"}
      Merchant.update(m1.id, update_parameters)

      expect(Merchant.find(m1.id).name).to eq("fake merchant")
      expect(Merchant.find(m1.id).id).to eq(1)
    end
  end

  describe '.delete' do
    it 'deletes an existing merchant' do
      m1 = Merchant.create(id: 1,
                      name: "Fake Merchant")
      Merchant.create(id: 2,
                      name: "Merchant")

      expect(Merchant.all.count).to eq(2)
      Merchant.delete(m1.id)
      expect(Merchant.all.count).to eq(1)
      merchant_ids = Merchant.pluck(:id)
      expect(merchant_ids).to_not include(m1.id)
    end
  end
end
