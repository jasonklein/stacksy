class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.string :relationship_status, null: false, default: :single
      t.integer :age, null: false
      t.string :location, null: false
      t.string :role, null: false, default: :basic
      t.string :other, null: false, default: ""

      t.timestamps
    end
  end
end
