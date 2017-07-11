class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.string :name
      t.string :participants
      t.text :description
    end
  end
end
