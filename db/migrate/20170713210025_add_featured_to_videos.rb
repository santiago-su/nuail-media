class AddFeaturedToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :featured, :boolean, default: false
    add_column :videos, :created_at, :datetime
    add_column :videos, :updated_at, :datetime
  end
end
