class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :slug
      t.string :category
      t.integer :ordinal

      t.timestamps
    end
  end
end
