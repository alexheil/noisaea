class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table(:developers) do |t|
      t.references :buffalo
      t.string :title
      t.string :category
      t.string :slug
      t.string :image
      t.text :content

      t.timestamps
    end

    add_index :developers, :buffalo_id
    add_index :developers, :slug
  end
end
