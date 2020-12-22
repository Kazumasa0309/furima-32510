class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|

      t.timestamps
    end
  end
end
