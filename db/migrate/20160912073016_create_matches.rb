class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|

    	t.integer :player1
    	t.integer :player2
    	t.integer :score_player1
    	t.integer :score_player2
    	t.references :user, index: true, foreign_key: true
    	t.references :tournoi, index: true, foreign_key: true

        t.timestamps null: false
    end
  end
end
