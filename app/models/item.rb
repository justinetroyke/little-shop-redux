class Item < ActiveRecord::Base
  validates_presence_of :name, :unit_price, :description, :image

  def self.update(item_id, update_parameters)
    item = Item.find(item_id)
    update_parameters[:updated_at] = Time.now
    item.update(update_parameters)
  end

  def self.delete(item_id)
    item = Item.find(item_id)
    item.destroy
  end
end
