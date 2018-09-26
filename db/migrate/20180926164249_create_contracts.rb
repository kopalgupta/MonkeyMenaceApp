class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :complaint, index: true, foreign_key: true
      t.references :official, index: true, foreign_key: true
      t.references :catcher, index: true, foreign_key: true
      t.integer :status
      t.text :description
      t.integer :amount

      t.timestamps null: false
    end
  end
end
