class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :ordinal
      t.string :name
      t.integer :tag_ordinal
      t.references :tag
      t.string :slug
      t.string :vimeoid
      t.text :description

      t.timestamps
    end
    add_index :videos, [:tag_id, :tag_ordinal, :ordinal]
  end
end
