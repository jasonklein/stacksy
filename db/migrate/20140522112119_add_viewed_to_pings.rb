class AddViewedToPings < ActiveRecord::Migration
  def change
    add_column :pings, :viewed, :boolean, default: false
  end
end
