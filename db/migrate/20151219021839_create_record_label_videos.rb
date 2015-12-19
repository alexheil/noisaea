class CreateRecordLabelVideos < ActiveRecord::Migration
  def change
    create_table(:record_label_videos) do |t|
      t.references :record_label
      t.string :title
      t.text :description
      t.string :youtube_url
      t.string :slug

      t.timestamps
    end

    add_index :record_label_videos, :record_label_id
  end
end
