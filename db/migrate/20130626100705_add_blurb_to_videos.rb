class AddBlurbToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :blurb, :string
  end
end
