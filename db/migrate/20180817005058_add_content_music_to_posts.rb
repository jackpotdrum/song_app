class AddContentMusicToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :content_music, :binary
  end
end
