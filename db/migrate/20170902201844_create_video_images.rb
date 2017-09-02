class CreateVideoImages < ActiveRecord::Migration
  def change
    create_table :video_images do |t|
      t.integer :video_id
      t.string :file_url
    end
  end
end
