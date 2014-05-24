class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :image_1, null: false, default: "default.jpg"
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :image_5
      t.text :fav_characters
      t.text :fav_spots
      t.text :fav_places
      t.string :guilty_pleasure
      t.string :occupation
      t.string :icon
      t.text :interests
      t.string :link
      t.string :quip
      t.integer :flags, null: false, default: 0
      t.text :fb_interests
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
