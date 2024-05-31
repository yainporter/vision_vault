class CreateVisionBoardImages < ActiveRecord::Migration[7.1]
  def change
    create_table :vision_board_images do |t|
      t.references :vision_board, null: false, foreign_key: true
      t.references :image, null: true, foreign_key: true

      t.timestamps
    end
  end
end
