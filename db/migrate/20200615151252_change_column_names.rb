class ChangeColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :followings, :FollowerId, :follower_id
    rename_column :followings, :FollowedId, :followed_id
  end
    add_index :followings, :follower_id
    add_index :followings, :followed_id
    add_index :followings, [:follower_id, :followed_id], unique: true
end
