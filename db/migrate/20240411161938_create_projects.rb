class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :image_url
   

      t.timestamps
    end
  end
end
