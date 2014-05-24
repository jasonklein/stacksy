class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.integer :pinger_id
      t.integer :pinged_id
      t.string :ping_type

      t.timestamps
    end
  end
end
