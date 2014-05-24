class ChangeGenderToGenderIdInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :gender, :gender_id
    change_column :users, :gender_id, :integer
  end
end
