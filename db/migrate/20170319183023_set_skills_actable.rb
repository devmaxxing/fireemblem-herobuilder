class SetSkillsActable < ActiveRecord::Migration[5.0]
  def change
    change_table :skills do |t|
      t.actable
    end
  end
end
