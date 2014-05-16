class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.string :relationship_status
      t.integer :age
      t.string :location
      t.string :role
      t.string :other
      t.integer :user_id

      t.timestamps
    end
  end
end
