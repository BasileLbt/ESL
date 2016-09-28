class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|

    	t.references :users, index: true, foreign_key: true
    	t.references :tournoi, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
