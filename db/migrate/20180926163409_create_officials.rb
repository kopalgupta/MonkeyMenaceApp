class CreateOfficials < ActiveRecord::Migration
  def change
    create_table :officials do |t|
      t.string :name
      t.string :off_code
      t.string :email
      t.integer :phone
      t.string :password

      t.timestamps null: false
    end
  end
end
