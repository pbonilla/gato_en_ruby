class Game
  attr_accessor :table
  
  def initialize()
   @table =  Array.new
   create_rows_on(@table)
  end


  def create_rows_on(table)
    3.times do
      @table.push([0,0,0])
    end
  end
  
  def show_table
    @table.each { |row| puts row }
  end

  def hello_world
    puts "Hello World"
  end
  
   
end

Juego = Game.new
Juego.show_table
