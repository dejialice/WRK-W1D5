class KnightPathFinder 

  attr_reader :grid

  def initialize(starting_position)
    @starting_position = starting_position
    @grid = Array.new(8){Array.new(8)}
  end
  
  def [](pos)
    row, col = pos
    self[row][col]
  end
  
  def []=(pos, val)
    row, col = pos 
    self[row][col] = val
  end

  def self.valid_moves(pos)
  end 

end