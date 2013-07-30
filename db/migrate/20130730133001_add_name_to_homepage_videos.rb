class AddNameToHomepageVideos < ActiveRecord::Migration
  def change
    add_column :homepage_videos, :name, :string
  end
end
