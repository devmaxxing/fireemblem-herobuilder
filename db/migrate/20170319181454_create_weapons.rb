class CreateWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :weapons do |t|
      t.string :weapon_type
      t.integer :might
      t.integer :range
    end
  end
end
