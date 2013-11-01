class Logic
  def if_there_is_a_winner?
     return check_rows || check_columns || check_diagonals
  end

  def check_rows
   result =  rows.map{|row| count_how_many_player_entries_are(row)}
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

  def count_how_many_player_entries_are(array)
    array.select{|entry| entry == @player}.count
  end

  def is_a_winner?(array_with_checked_entries)
    array_with_checked_entries.member?(3)
  end

  def insert_position_on_table(x,y)
    @board[x][y] = @player 
  end

  def is_used?(x,y)
     @board[x][y] != 0
  end
end
