class Uploads < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
    end
  end
end
