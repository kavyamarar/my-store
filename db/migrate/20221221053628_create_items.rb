class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :rate
      t.float :quantity, default: 0
      t.timestamps
    end
  end
end
