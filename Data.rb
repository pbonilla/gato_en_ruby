class Data

  attr_accessor :board
  
  def initialize()
    @board =  Array.new
    create_board
  end

  def create_board
    3.times do
      @board.push([0,0,0])
    end
  end

  def rows
    @board
  end
  
  def columns
    columns = Array.new
    for i in 0..2
      col = create_column(@board[0][i], @board[1][i], @board[2][i])
      columns.push(col)
    end
    columns 
  end

  def create_column(e_row1, e_row2, e_row3)
	column = [e_row1,e_row2,e_row3]
  end
  
  def create_diagonals  
    diagonals = [create_diagonal_left_to_right,create_diagonal_right_to_left]
  end
  
  def create_diagonal_left_to_right
     diagonal = [@board[0][0], @board[1][1], @board[2][2]]
  end

  def create_diagonal_right_to_left
     diagonal = [@board[0][2], @board[1][1],@board[2][0]]
  end
end
