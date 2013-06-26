class CreateHomepageVideos < ActiveRecord::Migration
  def change
    create_table :homepage_videos do |t|
      t.integer :ordinal
      t.string :video
      t.string :image
      t.timestamps
    end
  end
end
