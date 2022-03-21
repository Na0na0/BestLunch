class RenameRatingsValueToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :ratings, :value, :name
  end
end
