class UpdateItemsTableWithMerchantId < ActiveRecord::Migration[5.2]
  def change
    change_table :items do |t|
      t.integer :merchant_id
    end
  end
end
