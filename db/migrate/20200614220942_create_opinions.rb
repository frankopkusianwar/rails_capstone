class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.integer :AuthorId
      t.text :Text

      t.timestamps
    end
  end
end
