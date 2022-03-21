class AddIndexesToProposalsAndVoters < ActiveRecord::Migration[7.0]
  def change
    add_index :proposals, [:name, :survey_id], unique: true
    add_index :voters, [:email, :survey_id], unique: true
  end
end
