class Game
  attr_accessor :table
  
  def initialize()
   @table =  Array.new
   create_rows_on_table
  end

  ##TABLE SECTION ##
  def create_rows_on_table
    3.times do
      @table.push([0,0,0])
    end
  end
  
  def show_table
   puts "----------"
   @table.each { |row| puts row.join(" ") }
   puts "----------"
  end


  ##CHECK SECTION##
  def check_if_there_is_a_winner(player)
     if(check_rows(player))
       true
     elsif(check_columns(player))
       true
     #elsif(check_diagonals)
     ##  true
     else
       false
     end
  end

  def check_rows(player)
   result =  @table.map{|row| count_how_many_player_entries_are(player,row)}
   is_a_winner?(result)
  end

  def check_columns(player)
    result = get_columns.map{ |col| count_how_many_player_entries_are(player,col)}
    is_a_winner?(result)
  end

  def check_diagonals(player)

  end

  def count_how_many_player_entries_are(player, array)
    array.select{|entry| entry == player}.count
  end

  def get_columns
   columns = Array.new
   for i in 0..2
     columns.push([@table[0][i],@table[1][i],@table[2][i]])
   end
  end
  
  def is_a_winner?(data)
    data.member?(3)
  end
  
  ## INPUT ##
  
 def insert_position_on_table(x,y,player)
    row = @table.slice(x)
    row[y] = player
  end

  def get_axis_from_keyboard(axis)
     print "Please enter the #{axis} position: "
     axle = gets
     axle.to_i
  end


 ## Main flow ## 
 def playing_role
   player = 1
   while(true)
     self.show_table
     print "Player #{player} is your turn\n"
     x = get_axis_from_keyboard("x")
     y = get_axis_from_keyboard("y")
     insert_position_on_table(x,y,player)
     if(check_if_there_is_a_winner(player))
        break
     end
     if(player == 1)
       player = 2
     else
       player = 1
     end
   end
 end
 

Juego = Game.new
Juego.playing_role
   
end
