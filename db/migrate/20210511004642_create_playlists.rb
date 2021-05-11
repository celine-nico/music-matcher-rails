class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.string :name 
      t.integer :user_id 
      t.integer :song_id 
      t.string :description    
      t.timestamps
    end
  end
end