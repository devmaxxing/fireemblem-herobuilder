class CreateSpecials < ActiveRecord::Migration[5.0]
  def change
    create_table :specials do |t|
      t.integer :cooldown
    end
  end
end
