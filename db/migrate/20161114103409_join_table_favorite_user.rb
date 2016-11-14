class JoinTableFavoriteUser < ActiveRecord::Migration
  def change
  	create_join_table :favorites, :users do |t|
       t.index [:favorite_id, :user_id]
       t.index [:user_id, :favorite_id]
   end
  end
end
