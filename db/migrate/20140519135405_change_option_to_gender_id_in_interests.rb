class ChangeOptionToGenderIdInInterests < ActiveRecord::Migration
  def change
    rename_column :interests, :option, :gender_id
    change_column :interests, :gender_id, :integer
  end
end
