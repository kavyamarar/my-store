class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :rate
      t.float :quantity
      t.timestamps
    end
  end
end
