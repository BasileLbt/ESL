class CreateJeuxVideos < ActiveRecord::Migration
  def change
    create_table :jeux_videos do |t|

      t.timestamps null: false
    end
  end
end
