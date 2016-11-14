class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.string :author_name
      t.text :body
      t.string :rating
      t.references :jeux_video, index: true

      t.timestamps null: false
    end
  end
end
