class ChangeColumnToUploads < ActiveRecord::Migration[7.1]
  def change
    rename_column :vision_board_images, :image_id, :upload_id
  end
end
