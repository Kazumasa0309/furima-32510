class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|
      t.references :order,         foreign_key: true
      t.string     :postal_code,   null: false
      t.text       :prefecture_id, null: false
      t.string     :municipality,  null: false
      t.string     :address,       null: false
      t.string     :building,      null: false
      t.string     :phone_number,  null: false
      t.timestamps
    end
  end
end
