class AddIndexToAccessTokens < ActiveRecord::Migration
  def up
    add_index(:access_tokens, :token, { name: "access_tokens_token_index", unique: true, length: 16 })
  end

  def down
    remove_index(:access_tokens, name: "access_tokens_token_index")
  end
end
