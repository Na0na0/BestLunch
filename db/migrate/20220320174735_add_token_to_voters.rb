class AddTokenToVoters < ActiveRecord::Migration[7.0]
  def change
    add_column :voters, :token, :string
    add_index :voters, :token, unique: true
  end
end
