class AddDurationToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :duration, :integer
  end
end
