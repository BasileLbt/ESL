class CreateJoinTableJeuUser < ActiveRecord::Migration
  def change
    create_join_table :jeux_videos, :users do |t|
      # t.index [:jeux_video_id, :user_id]
      # t.index [:user_id, :jeux_video_id]
    end
  end
end
