class AddFeaturedToEditorials < ActiveRecord::Migration
  def change
    add_column :editorials, :featured, :boolean, default: false
    add_column :editorials, :created_at, :datetime
    add_column :editorials, :updated_at, :datetime
  end
end
