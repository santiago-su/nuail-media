class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :embed_url
      t.string :participants
      t.text :description
    end
  end
end
