class CreateVisionBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :vision_boards do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
