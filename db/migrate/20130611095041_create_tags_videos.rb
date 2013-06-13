class CreateTagsVideos < ActiveRecord::Migration
  def change
    create_table :tags_videos do |t|
      t.references :tag
      t.references :video

      t.timestamps
    end
    add_index :tags_videos, [:tag_id, :video_id], unique: true
  end
end
