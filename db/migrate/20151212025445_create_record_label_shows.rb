class CreateRecordLabelShows < ActiveRecord::Migration
  def change
    create_table(:record_label_shows) do |t|
      t.references :record_label
      t.string :artist
      t.integer :month
      t.integer :day
      t.integer :year
      t.string :venue
      t.string :location
      t.text :description
      t.string :ticket_url
      t.string :flyer_url

      t.timestamps
    end

    add_index :record_label_shows, :record_label_id
  end
end
