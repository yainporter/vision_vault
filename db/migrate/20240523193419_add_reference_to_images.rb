class AddReferenceToImages < ActiveRecord::Migration[7.1]
  def change
    add_reference :images, :vision_board, null: true, foreign_key: true
  end
end
