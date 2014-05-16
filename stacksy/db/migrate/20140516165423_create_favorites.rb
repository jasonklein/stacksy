class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :favoriter_id
      t.integer :favorited_id

      t.timestamps
    end
  end
end
