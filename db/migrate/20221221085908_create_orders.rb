class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :date, null: false
      t.float :quantity, null: false
      t.float :total, null: false
      t.references :item, foregn_key: true
      t.timestamps
    end
  end
end
