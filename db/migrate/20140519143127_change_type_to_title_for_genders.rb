class ChangeTypeToTitleForGenders < ActiveRecord::Migration
  def change
    rename_column :genders, :type, :title
  end

end
