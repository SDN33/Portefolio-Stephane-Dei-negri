class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.integer :price_cents
      t.string :image_url

      t.timestamps
    end
  end
end
