class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|

    	t.string :title
    	t.references :user, index: true
    	t.references :jeux_video, index: true

      t.timestamps null: false
    end
  end
end
