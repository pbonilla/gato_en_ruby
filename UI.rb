class Game
  attr_accessor :player
  
  def initialize
   @current_player = 1
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
    while(true)      
      axis_array = axis
      if(is_valid_position?(axis_array))
      	return axis_array
      print "Entry occupied. Could you please enter another?\n"
    end
  end
  
  def axis
	[axis_from_keyboard("x"),axis_from_keyboard("y")]
  end

  def valid_position?(axis)
    if(!is_used?(axis))
       true
    else
       false
    end
  end


  def switch_player_active
    @current_player == 1 ? @current_player = 2 : @current_player =1 
  end
  
  def game_has_a_winner?
    if(there_is_a_winner?)
       show_table
       print "Congratulations player #{@current_player} you win!!\n"
       return true
    end
    return false
  end

  def player_round
    print "Player #{@current_player} is your turn\n"
    position = ask_for_position
    insert_position_on_board(position[0],position[1])
  end  
  
  def playing_role
    while(true)
      player_round     
      if(game_has_a_winner?)
         break
      end
      switch_player_active
    end
  end

Juego = Game.new
Juego.playing_role
   
end
