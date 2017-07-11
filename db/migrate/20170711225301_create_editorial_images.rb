class CreateEditorialImages < ActiveRecord::Migration
  def change
    create_table :editorial_images do |t|
      t.integer :editorial_id
      t.string :file_url
    end
  end
end
