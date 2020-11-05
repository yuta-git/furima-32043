class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer        :category_id,          null: false
      t.integer        :price,                null: false
      t.string         :item_name,            null: false
      t.text           :item_description,     null: false
      t.integer        :condition_id,         null: false
      t.integer        :delivery_charge_id,   null: false
      t.integer        :prefecture_id,        null: false
      t.integer        :delivery_days_id,     null: false
      t.references     :user,                 foreign_key: true
      t.timestamps
    end
  end
end
