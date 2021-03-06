class Item < ActiveRecord::Base
  validates_presence_of :name, :unit_price, :description, :image
  belongs_to :merchant

  def self.update(item_id, update_parameters)
    item = Item.find(item_id)
    update_parameters[:updated_at] = Time.now
    item.update(update_parameters)
  end

  def self.delete(item_id)
    item = Item.find(item_id)
    item.destroy
  end

  def self.average_price
    average(:unit_price)
  end

  def self.most_recently_created
    Item.all.sort_by(&:updated_at).reverse.first
  end

  def self.oldest_item
    Item.all.sort_by(&:created_at).first
  end
end
