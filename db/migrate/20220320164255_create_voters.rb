class CreateVoters < ActiveRecord::Migration[7.0]
  def change
    create_table :voters do |t|
      t.string :email
      t.belongs_to :survey

      t.timestamps
    end
  end
end
