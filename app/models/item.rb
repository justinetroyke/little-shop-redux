class Item < ActiveRecord::Base
  validates_presence_of :name, :unit_price, :description, :image

  def self.update(item_id, update_parameters)
    item = Item.find_by(item_id: item_id)
    item.update(update_parameters)
  end

  def self.delete(item_id)
    item = Item.find_by(item_id: item_id)
    item.destroy
  end
end
