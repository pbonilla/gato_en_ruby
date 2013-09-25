class Game
  attr_accessor :table, :player
  
  def initialize()
   @table =  Array.new
   create_rows_on_table
   @player = 1
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
  def if_there_is_a_winner?
     return check_rows || check_columns || check_diagonals
  end

  def check_rows
   result =  @table.map{|row| count_how_many_player_entries_are(row)}
   is_a_winner?(result)
  end

  def check_columns
    result = columns.map{ |col| count_how_many_player_entries_are(col)}
    is_a_winner?(result)
  end

  def check_diagonals
    diagonals = create_diagonals
    result = diagonals.map{ |col| count_how_many_player_entries_are(col)}
    is_a_winner?(result)
  end

  def create_diagonals  
    diagonals = Array.new
    diag_l_to_r = create_diagonal_left_to_right
    diag_r_to_l = create_diagonal_right_to_left
    diagonals.push(diag_l_to_r)
    diagonals.push(diag_r_to_l)
    diagonals 
  end

  def count_how_many_player_entries_are(array)
    array.select{|entry| entry == @player}.count
  end

  def columns
   columns = Array.new
   for i in 0..2
     col = create_column(@table[0][i], @table[1][i], @table[2][i])
     columns.push(col)
   end
   columns 
  end

  def create_column(e_row1, e_row2, e_row3)
	col = Array.new
	col.push(e_row1)
	col.push(e_row2)
	col.push(e_row3)
	col
  end

  def create_diagonal_left_to_right
     diagonal = Array.new
     diagonal.push(@table[0][0])
     diagonal.push(@table[1][1])
     diagonal.push(@table[2][2])
     diagonal
  end

  def create_diagonal_right_to_left
     diagonal = Array.new
     diagonal.push(@table[0][2])
     diagonal.push(@table[1][1])
     diagonal.push(@table[2][0])
     diagonal
  end
  
  def is_a_winner?(array_with_checked_entries)
    array_with_checked_entries.member?(3)
  end
  
  ## INPUT ##
  
  def insert_position_on_table(x,y)
    @table[x][y] = @player 
  end

  def axis_from_keyboard(axis)
     print "Please enter the #{axis} position: "
     axle = gets
     axle.to_i
  end

  def ask_for_position
    position = Array.new
    while(true)      
      x = get_axis_from_keyboard("x")
      y = get_axis_from_keyboard("y")
      if(!is_used?(x,y))
        position.push(x)
        position.push(y)
        break
      end
      print "Entry occupied. Could you please enter another?\n"
    end
    position
  end

  def is_used?(x,y)
     @table[x][y] != 0
  end


 ## Main flow ## 
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

def switch_player_active 
     if(@player == 1)
       @player = 2
     else
       @player = 1
     end
end
Juego = Game.new
Juego.playing_role
   
end
