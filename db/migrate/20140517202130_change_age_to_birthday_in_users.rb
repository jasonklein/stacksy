class ChangeAgeToBirthdayInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :age, :birthday
    change_column :users, :birthday, :date
  end
end
