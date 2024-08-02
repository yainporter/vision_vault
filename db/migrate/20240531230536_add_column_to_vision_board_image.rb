class AddColumnToVisionBoardImage < ActiveRecord::Migration[7.1]
  def change
    add_column :vision_board_images, :unsplash_id, :string
  end
end
