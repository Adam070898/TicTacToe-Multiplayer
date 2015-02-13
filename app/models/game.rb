class Game < ActiveRecord::Base
  def players
    p1 = User.where(id: self.p1)
    p2 = User.where(id: self.p2)
    return [ p1, p2 ]
  end

  def draw
    self.update(status: "draw")
  end

  def p1
    self.update(status: "p1")
  end

  def p2
    self.update(status: "p2")
  end

  def self.history(playerid)
    [Game.where(player1: playerid),Game.where(player2: playerid)].flatten
  end

  def result
    case self.status
    when "p1"; return "Winner: " + User.where(id: self.player1).first.name
    when "p2"; return "Winner: " + User.where(id: self.player2).first.name
    when "draw"; return "Draw"
    when "waiting"; return "Ongoing"
    end
  end

  def change(index, replacement)
    newboard = self.board
    newboard[index.to_i] = replacement
    self.update(board: newboard)
  end
end
