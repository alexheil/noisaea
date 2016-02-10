class AddEmailChoiceToUsers < ActiveRecord::Migration
  def change
    add_column :artists, :comment_email, :boolean, default: true
    add_column :artists, :follow_email, :boolean, default: true
    add_column :record_labels, :comment_email, :boolean, default: true
    add_column :record_labels, :follow_email, :boolean, default: true
    add_column :venues, :comment_email, :boolean, default: true
    add_column :venues, :follow_email, :boolean, default: true
    add_column :producers, :comment_email, :boolean, default: true
    add_column :producers, :follow_email, :boolean, default: true

    add_column :artist_profiles, :letlyrics_url, :string, default: ""
    add_column :record_label_profiles, :letlyrics_url, :string, default: ""
    add_column :venue_profiles, :letlyrics_url, :string, default: ""
    add_column :producer_profiles, :letlyrics_url, :string, default: ""
  end
end
