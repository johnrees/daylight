class CreateFeaturedVideos < ActiveRecord::Migration
  def change
    create_table :featured_videos do |t|
      t.references :video, index: true

      t.timestamps
    end
  end
end
