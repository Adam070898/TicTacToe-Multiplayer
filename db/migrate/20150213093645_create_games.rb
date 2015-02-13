class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :player1
      t.integer :player2
      t.string :board, default: "000000000"
      t.string :status, default: "waiting"
      t.string :turn, default: "X"
    end
  end
end
