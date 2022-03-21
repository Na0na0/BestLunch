class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.belongs_to :voter, null: false, foreign_key: true
      t.belongs_to :proposal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
