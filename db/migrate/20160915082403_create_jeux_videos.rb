class CreateJeuxVideos < ActiveRecord::Migration
  def change
    create_table :jeux_videos do |t|
    	t.string :title
  		t.text :body
  		t.text :commentaire
  		t.integer :nb_joueur
  		t.string :server
  		t.string :champion
      t.integer :users_count 

  		t.references :users, index: true
  		t.references :tournois, index: true

  		t.timestamps null: false
    end
  end
end
