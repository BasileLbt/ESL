class AddParamsToJeuxVideos < ActiveRecord::Migration
  def change
  		add_column :jeux_videos, :title, :string
  		add_column :jeux_videos, :body, :text
  		add_column :jeux_videos, :comments, :text
  		add_column :jeux_videos, :nb_joueur, :integer
  		add_column :jeux_videos, :server, :string
  		add_column :jeux_videos, :champion, :array
  end
end
