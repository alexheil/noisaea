class CreatePosts < ActiveRecord::Migration
  def change
    create_table(:posts) do |t|
      t.references :buffalo
      t.string :title
      t.string :category
      t.string :slug
      t.string :image
      t.text :content

      t.timestamps
    end

    add_index :posts, :buffalo_id
    add_index :posts, :slug
  end
end
