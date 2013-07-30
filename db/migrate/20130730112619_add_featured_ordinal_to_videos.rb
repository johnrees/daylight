class AddFeaturedOrdinalToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :featured_ordinal, :integer
  end
end
