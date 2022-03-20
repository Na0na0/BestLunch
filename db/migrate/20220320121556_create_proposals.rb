class CreateProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :proposals do |t|
      t.string :name
      t.belongs_to :survey

      t.timestamps
    end
  end
end
