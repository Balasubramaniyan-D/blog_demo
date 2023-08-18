class AddUserIdToBlogpost < ActiveRecord::Migration[7.0]
  def change
    add_column :blogposts, :user_id, :integer
    add_index :blogposts, :user_id
  end
end
