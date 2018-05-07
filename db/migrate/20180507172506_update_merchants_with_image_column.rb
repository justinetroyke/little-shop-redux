class UpdateMerchantsWithImageColumn < ActiveRecord::Migration[5.2]
  def change
    change_table :merchants do |t|
      t.string :image
    end
  end
end
