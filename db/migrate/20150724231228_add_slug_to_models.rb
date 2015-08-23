class AddSlugToModels < ActiveRecord::Migration
  def change
    add_column :artists, :slug, :string
    add_index :artists, :slug, unique: true
    add_column :record_labels, :slug, :string
    add_index :record_labels, :slug, unique: true
    add_column :venues, :slug, :string
    add_index :venues, :slug, unique: true
    add_column :producers, :slug, :string
    add_index :producers, :slug, unique: true
    add_column :fans, :slug, :string
    add_index :fans, :slug, unique: true

    add_column :artist_profiles, :website, :string, default: ""
    add_column :record_label_profiles, :website, :string, default: ""
    add_column :venue_profiles, :website, :string, default: ""
  end
end
