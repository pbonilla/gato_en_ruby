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
  def check_if_there_is_a_winner
     if(check_rows)
       true
     elsif(check_columns)
       true
     elsif(check_diagonals)
       true
     else
       false
     end
  end

  def check_rows
   result =  @table.map{|row| count_how_many_player_entries_are(row)}
   is_a_winner?(result)
  end

  def check_columns
    result = get_columns.map{ |col| count_how_many_player_entries_are(col)}
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

  def get_columns
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
     diagonal.join(" ")
     diagonal
  end

  def create_diagonal_right_to_left
     diagonal = Array.new
     diagonal.push(@table[0][2])
     diagonal.push(@table[1][1])
     diagonal.push(@table[2][0])
     diagonal.join(" ")
     diagonal
  end
  
  def is_a_winner?(data)
    if(data.member?(3))
      true
    else
      false
    end
  end
  
  ## INPUT ##
  
 def insert_position_on_table(x,y)
    row = @table.slice(x)
    if(row[y] == 0)
      row[y] =  @player
    else
      print "ERROR"
    end
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
     print "Player #{@player} is your turn\n"
     x = get_axis_from_keyboard("x")
     y = get_axis_from_keyboard("y")
     insert_position_on_table(x,y)
     if(check_if_there_is_a_winner)
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
