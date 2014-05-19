class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :type, null: false, default: 'custom'

      t.timestamps
    end
  end
end
