class RenameFromTableToTweetsOnOwatters < ActiveRecord::Migration[5.1]
  def change
    rename_table :tweets, :owatters
  end
end
