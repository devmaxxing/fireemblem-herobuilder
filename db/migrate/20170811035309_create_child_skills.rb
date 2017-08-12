class CreateChildSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :child_skills do |t|
      t.integer :parent_id
      t.integer :child_id
    end
  end
end
