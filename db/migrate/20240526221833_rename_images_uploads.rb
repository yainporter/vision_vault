class RenameImagesUploads < ActiveRecord::Migration[7.1]
  def change
    rename_table :images, :uploads
  end
end
