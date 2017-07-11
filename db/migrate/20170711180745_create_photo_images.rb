class CreatePhotoImages < ActiveRecord::Migration
  def change
    create_table :photo_images do |t|
      t.integer :photo_id
      t.string :file_url
    end
  end
end
