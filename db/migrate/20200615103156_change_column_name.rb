class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :opinions, :AuthorId, :user_id
  end
end
