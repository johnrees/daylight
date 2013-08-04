class AddPriorityToHomepageVideos < ActiveRecord::Migration
  def change
    add_column :homepage_videos, :priority, :integer
  end
end
