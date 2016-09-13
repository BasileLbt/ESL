class AddParamsToTournois < ActiveRecord::Migration
  def change
  	add_column :tournois, :title, :string
  	add_column :tournois, :pays, :string
  	add_column :tournois, :lieu, :string
  	add_column :tournois, :date, :time
  	add_column :tournois, :heure_inscription, :time
  	add_column :tournois, :regles, :text
  	add_column :tournois, :jeux_proposés, :array
  	add_column :tournois, :nb_joueurs_max, :number
  	add_column :tournois, :recompenses, :text
  	add_column :tournois, :niveau_de_jeu, :string
    add_column :tournois, :latitude, :float
    add_column :tournois, :longitude, :float
  end
end
