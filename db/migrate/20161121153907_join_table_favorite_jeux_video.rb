class JoinTableFavoriteJeuxVideo < ActiveRecord::Migration
  def change
  	create_join_table :favorites, :jeux_videos do |t|
       t.index [:favorite_id, :jeux_video_id]
       t.index [:jeux_video_id, :favorite_id]
    end
  end
end
