class AddImageNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_name, :binary, :limit => 5.megabyte
  end
end
