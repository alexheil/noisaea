class AddThemeToUsers < ActiveRecord::Migration
  def change
    add_column :artist_profiles, :theme_color, :string, default: ""
    add_column :record_label_profiles, :theme_color, :string, default: ""
    add_column :venue_profiles, :theme_color, :string, default: ""
    add_column :producer_profiles, :theme_color, :string, default: ""
    add_column :fan_profiles, :theme_color, :string, default: ""
  end
end
