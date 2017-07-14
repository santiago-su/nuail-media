class AddFeaturedToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :featured, :boolean, default: false
    add_column :photos, :created_at, :datetime
    add_column :photos, :updated_at, :datetime
  end
end
