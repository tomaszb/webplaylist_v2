class Addurltosongs < ActiveRecord::Migration
  def change
  	add_column :songs, :url, :string
  	add_index :songs, :url
  end
end
