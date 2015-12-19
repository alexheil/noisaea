class CreateProducerVideos < ActiveRecord::Migration
  def change
    create_table(:producer_videos) do |t|
      t.references :producer
      t.string :title
      t.text :description
      t.string :youtube_url
      t.string :slug

      t.timestamps
    end

    add_index :producer_videos, :producer_id
  end
end
