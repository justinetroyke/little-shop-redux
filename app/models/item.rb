class Item < ActiveRecord::Base
  validates_presence_of :name, :unit_price, :description
end
