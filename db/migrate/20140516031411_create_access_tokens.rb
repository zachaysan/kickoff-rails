class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.string :token, unique: true, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
