class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :tracker
      t.references :tracked

      t.timestamps
    end
    add_index :tracks, :tracker_id
    add_index :tracks, :tracked_id
  end
end
