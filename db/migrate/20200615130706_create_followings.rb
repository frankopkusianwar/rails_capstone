class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :FollowerId
      t.integer :FollowedId

      t.timestamps
    end
    add_index :followings, :follower_id
    add_index :followings, :followed_id
    add_index :followings, [:follower_id, :followed_id], unique: true

  end
end
