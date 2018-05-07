class UpdateItemsTableWithMerchantId < ActiveRecord::Migration[5.2]
  def change
    remove_column :merchants, :merchant_id
    change_table :merchants do |t|
      t.integer :id
    end
  end
end
