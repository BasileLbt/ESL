class CreateTournois < ActiveRecord::Migration
  def change
    create_table :tournois do |t|
    t.string :title 
  	t.string :pays 
  	t.string :lieu 
  	t.datetime :date
  	t.datetime :heure_inscription
  	t.text :regles
  	t.string :jeux_proposés
  	t.integer :nb_joueurs_max
  	t.text :recompenses
  	t.string :niveau_de_jeu
    t.float :latitude
    t.float :longitude
    t.string :winner
    t.integer :users_count

    t.references :users, index: true
    t.references :matchs, index: true
    t.references :jeux_videos, index: true

    t.timestamps null: false

    end
  end
end
