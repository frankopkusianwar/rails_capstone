class ChangeColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :followings, :FollowerId, :follower_id
    rename_column :followings, :FollowedId, :followed_id
  end
end
