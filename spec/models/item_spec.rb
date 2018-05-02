RSpec.describe Item do
  describe 'Validations' do
    describe 'required fields' do
      it 'should be invalid if missing a name' do
        item = Item.create(item_id: 123213, description: "New thing", unit_price: 132, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

        expect(item).to_not be_valid
      end

      it 'should be invalid if missing a description' do
        item = Item.create(item_id: 123213, name: "Newer Thing", unit_price: 132, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

        expect(item).to_not be_valid
      end

      it 'should be invalid if missing an unit price' do
        item = Item.create(item_id: 123213, description: "New thing", name: "Newer Thing", image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

        expect(item).to_not be_valid
      end

      it 'should be invalid if missing an image' do
        item = Item.create(item_id: 123213, description: "New thing", name: "Newer Thing", unit_price: 10, created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

        expect(item).to_not be_valid
      end
    end
  end

  describe 'Class Methods' do
    describe '.create' do
      it 'creates a new item' do
        Item.create(item_id: 2, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")

        expect(Item.all.length).to eq(1)
        expect(Item.all.first.item_id).to eq(2)
        expect(Item.all.first.description).to eq("New thing")
        expect(Item.all.first.name).to eq("Newer Thing")
        expect(Item.all.first.unit_price).to eq(15)
      end
    end

    describe '.update' do
      it 'updates an existing item' do
        Item.create(item_id: 2, description: "New thing", name: "Newer Thing", unit_price: 15, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
        Item.create(item_id: 3, description: "Hello", name: "Nope", unit_price: 17, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
        Item.create(item_id: 4, description: "Never again", name: "Go Away", unit_price: 11, image: 'https://i.imgur.com/iXHefKS.png', created_at: "2002-11-18 00:00:00", updated_at: "2007-10-09 00:00:00")
        update_parameters = {description: "Nah", name: "Laugh"}
        Item.update(2, update_parameters)

        expect(Item.find_by(item_id: 2).name).to eq("Laugh")
        expect(Item.find_by(item_id: 2).description).to eq("Nah")
      end
    end
  end

end
