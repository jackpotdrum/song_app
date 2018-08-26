class AddContentImageToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :content_image, :binary, :limit => 5.megabyte
  end
end
