class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.references :user, foreign_key: true
      t.text :image
      t.text :description
      t.timestamps
    end
  end
end
