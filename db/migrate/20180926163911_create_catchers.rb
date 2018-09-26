class CreateCatchers < ActiveRecord::Migration
  def change
    create_table :catchers do |t|
      t.string :name
      t.text :location
      t.integer :phone
      t.string :password
      t.integer :price

      t.timestamps null: false
    end
  end
end
