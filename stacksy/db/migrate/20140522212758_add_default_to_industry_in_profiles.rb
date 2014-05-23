class AddDefaultToIndustryInProfiles < ActiveRecord::Migration
  def change
    change_column :profiles, :industry, :string, default: "Tech"
  end
end
