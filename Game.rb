class Game
  attr_accessor :player
  
  def initialize()
   @player = 1
  end
  
  def show_table
   puts "----------"
   @board.each { |row| puts row.join(" ") }
   puts "----------"
  end

  def axis_from_keyboard(axis)
     print "Please enter the #{axis} position: "
     axle = gets
     axle.to_i
  end

  def ask_for_position
    position = []
    while(true)      
      x = axis_from_keyboard("x")
      y = axis_from_keyboard("y")
      if(!is_used?(x,y))
	position = [ x, y]
        break
      end
      print "Entry occupied. Could you please enter another?\n"
    end
    position
  end
  
  def valid_position?

  end


  def switch_player_active
    @player == 1 ? @player = 2 : @player =1 
  end
  
  def playing_role
    player = 1
    while(true)
      self.show_table
      print "Player #{@player} is your turn\n"
      position = ask_for_position
      insert_position_on_table(position[0],position[1])
      if(if_there_is_a_winner?)
        show_table
  	print "Congratulations player #{@player} you win!!\n"
        break
      end
      switch_player_active
    end
  end

Juego = Game.new
Juego.playing_role
   
end
