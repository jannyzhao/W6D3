class AddForeignKeysToArtwork < ActiveRecord::Migration[7.0]
  def change
    remove_column :artworks, :artist_id
    add_column :artworks, :artist_id, :bigint, null: false, index: {unique: true}
    add_foreign_key :artworks, :users, column: :artist_id
    add_index :artworks, :image_url, unique: true
  end
end
