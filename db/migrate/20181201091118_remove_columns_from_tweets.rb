class RemoveColumnsFromTweets < ActiveRecord::Migration[5.1]
  def change
    remove_column(:tweets, :name)
    remove_column(:tweets, :email)
  end
end
