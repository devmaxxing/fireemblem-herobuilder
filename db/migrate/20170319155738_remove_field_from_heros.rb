class RemoveFieldFromHeros < ActiveRecord::Migration[5.0]
  def change
    remove_column :heros, :image_url
  end
end
