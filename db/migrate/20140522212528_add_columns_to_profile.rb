class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :industry, :string
    add_column :profiles, :why_tech, :string
    add_column :profiles, :stack, :string
  end
end
