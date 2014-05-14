class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address, unique: true, null: false
      t.integer :owner_id, null: false

      t.timestamps
    end
  end
end
