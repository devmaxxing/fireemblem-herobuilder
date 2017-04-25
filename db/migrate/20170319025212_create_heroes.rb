class CreateHeroes < ActiveRecord::Migration[5.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :colour
      t.string :weapon_type
      t.string :move_type
      t.string :image_url
    end
  end
end
