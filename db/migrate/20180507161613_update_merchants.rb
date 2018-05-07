class UpdateMerchants < ActiveRecord::Migration[5.2]
  def change
    remove_column :merchants, :merchant_id
  end
end
