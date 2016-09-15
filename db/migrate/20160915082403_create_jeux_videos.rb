class CreateJeuxVideos < ActiveRecord::Migration
  def change
    create_table :jeux_videos do |t|
    	t.string :title
  		t.text :body
  		t.text :comments
  		t.integer :nb_joueur
  		t.string :server
  		t.string :champion

  		t.timestamps null: false
    end
  end
end
