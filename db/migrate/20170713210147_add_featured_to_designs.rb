class AddFeaturedToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :featured, :boolean, default: false
    add_column :designs, :created_at, :datetime
    add_column :designs, :updated_at, :datetime
  end
end
