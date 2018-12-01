class RenameFromTableToTweetsOnContacts < ActiveRecord::Migration[5.1]
  def change
    rename_table :contacts, :tweets 
  end
end
