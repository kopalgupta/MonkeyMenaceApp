class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.references :user, index: true, foreign_key: true
      t.references :official, index: true, foreign_key: true
      t.text :description
      t.integer :monkeys_spotted
      t.string :location
      t.integer :status
      t.boolean :resolved

      t.timestamps null: false
    end
  end
end
