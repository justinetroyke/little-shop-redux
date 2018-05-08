class Merchant < ActiveRecord::Base
  validates_presence_of :name
  has_many :items
  def self.merchant_with_highest_price_item
    item = Item.all.sort_by(&:unit_price).reverse.first
    Merchant.find(item.merchant_id)
  end

  def self.merchant_info
    Merchant.joins(:items).select('merchants.*, avg(items.unit_price) as avg_price, sum(items.unit_price) as total_cost, count(items.id) as item_count').group('merchants.id')
  end
end
