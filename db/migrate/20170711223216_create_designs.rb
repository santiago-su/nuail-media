class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :name
      t.string :participants
      t.text :description
    end
  end
end
