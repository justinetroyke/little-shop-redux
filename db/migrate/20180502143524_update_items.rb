class UpdateItems < ActiveRecord::Migration[5.2]
  def change
    change_table :items do |t|
      t.text :image
    end
  end
end
