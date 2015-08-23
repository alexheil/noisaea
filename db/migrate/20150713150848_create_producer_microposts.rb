class CreateProducerMicroposts < ActiveRecord::Migration
  def change
    create_table(:producer_microposts) do |t|
      t.references :producer
      t.text :content

      t.timestamps
    end

    add_index :producer_microposts, :producer_id
  end
end
