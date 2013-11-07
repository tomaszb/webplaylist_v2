class AddYoutubeidToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :youtubeid, :string
    add_index :songs, :youtubeid
  end
end
