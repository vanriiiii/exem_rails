class DropTweets < ActiveRecord::Migration[5.1]
  def change
    drop_table :tweets
  end
end
