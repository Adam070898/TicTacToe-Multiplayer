class User < ActiveRecord::Base

  def self.login(email, pass)
    user = User.where(email: email, pass: pass).first
    user.nil? ?  nil : user.id
  end

  def self.register(name, email, pass)
    if ((name != "") || (email != "")) || (pass != "")
      if User.where(email: email).first.nil?
        User.create(email: email, pass: pass, name: name)
        return true
      else
        return nil
      end
    else return nil
    end
  end

  def history
    return [Game.where(player1: self.id), Game.where(player2: self.id)].flatten
  end

  def newgame(name)
    Game.create(name: name, player1: self.id)
  end
end
