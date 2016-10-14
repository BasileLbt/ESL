class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|

    	t.integer :player1_id
    	t.integer :player2_id
    	t.integer :score_player1
    	t.integer :score_player2
    	t.integer  :winner_id

    	t.references :user, index: true
    	t.references :tournoi, index: true

        t.timestamps null: false
    end
  end
end
