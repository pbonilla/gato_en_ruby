class Logic
  def if_there_is_a_winner?
     return check_rows || check_columns || check_diagonals
  end

  def check_rows
   array_with_marks_by_rows =  rows.map{|row| count_how_many_player_marks_are(row)}
   is_a_winner?(result)
  end

  def check_columns
    array_with_marks_by_columns = columns.map{ |col| count_how_many_player_marks_are(col)}
    is_a_winner?(result)
  end

  def check_diagonals
    diagonals = create_diagonals
    array_with_marks_by_diagonal = diagonals.map{ |col| count_how_many_player_marks_are(col)}
    is_a_winner?(result)
  end

  def count_how_many_player_marks_are(array)
    array.select{|entry| entry == @player}.count
  end

  def is_a_winner?(array_with_checked_marks)
    array_with_checked_marks.member?(3)
  end

  def insert_position_on_board(x,y)
    @board[x][y] = @player 
  end

  def is_used?(position)
     @board[position[0]][position[1]] != 0
  end
end
