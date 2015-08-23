class CreateVenueMicroposts < ActiveRecord::Migration
  def change
    create_table(:venue_microposts) do |t|
      t.references :venue
      t.text :content

      t.timestamps
    end

    add_index :venue_microposts, :venue_id
  end
end
