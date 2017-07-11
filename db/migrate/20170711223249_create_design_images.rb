class CreateDesignImages < ActiveRecord::Migration
  def change
    create_table :design_images do |t|
      t.integer :design_id
      t.string :file_url
    end
  end
end
