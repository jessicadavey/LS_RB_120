# What can we add to the Bingo class to allow it to inherit the play method 
# from the Game class?

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game # Now Bingo inherits play method from Game class
  def rules_of_play
    #rules of play
  end
end


p Bingo.new.play