class Merchant < ActiveRecord::Base
  validates_presence_of :name
  has_many :items

  def avg_item_price(id)
    items = Item.where(merchant_id: id)
    items.average(:unit_price)
  end

  def total_cost_of_items(id)
    items = Item.where(merchant_id: id)
    items.sum(:unit_price)
  end

  def self.merchant_with_highest_price_item
    item = Item.all.sort_by(&:unit_price).reverse.first
    Merchant.find(item.merchant_id)
  end

  def merchant_items
    Item.where(merchant_id: self.id).count
  end

  def self.merchant_with_most_item
    Merchant.all.sort_by(&:merchant_items).reverse.first
  end
end
