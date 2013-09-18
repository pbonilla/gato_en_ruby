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

  def insert_position_on_table(x,y,player)
    row = @table.slice(x)
    row[y] = player
  end

  def get_axis_from_keyboard(axis)
     print "Please enter the #{axis} position: "
     axle = gets
     axle.to_i
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

  def check_rows

  end

  def check_columns

  end

  def check_diagonals

  end

  def hello_world
    puts "Hello World"
  end
  
   
end

Juego = Game.new
Juego.show_table
Juego.insert_position_on_table(Juego.get_axis_from_keyboard("x"),Juego.get_axis_from_keyboard("y"),1)
Juego.show_table
