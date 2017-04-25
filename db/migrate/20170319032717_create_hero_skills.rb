class CreateHeroSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :hero_skills do |t|
      t.integer :hero_id
      t.integer :skill_id
      t.integer :rarity
    end
  end
end
