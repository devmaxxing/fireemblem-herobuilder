class AddIndexToSkills < ActiveRecord::Migration[5.0]
  def change
    add_index :skills, :sp_cost
  end
end
