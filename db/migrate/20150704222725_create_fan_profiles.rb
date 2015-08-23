class CreateFanProfiles < ActiveRecord::Migration
  def change
    create_table(:fan_profiles) do |t|
      t.references :fan
      t.text :biography, default: ""
      t.string :location, default: ""
      t.string :website, default: ""
      t.string :cover_image, default: ""
      t.string :profile_image, default: ""

      t.timestamps
    end

    add_index :fan_profiles, :fan_id, unique: true
  end
end
