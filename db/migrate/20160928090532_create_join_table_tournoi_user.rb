class CreateJoinTableTournoiUser < ActiveRecord::Migration
  def change
    create_join_table :tournois, :users do |t|
       t.index [:tournoi_id, :user_id]
       t.index [:user_id, :tournoi_id]
    end
  end
end
