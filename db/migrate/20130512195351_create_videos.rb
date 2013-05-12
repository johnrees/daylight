class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :slug
      t.string :vimeoid
      t.text :description

      t.timestamps
    end
  end
end
