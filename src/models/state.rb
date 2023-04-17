require_relative "../../configs"
require_relative "./directions"

module Model
  CONFIGS = Configs::CONSOLE_CONFIGS

  class Coord < Struct.new( :x_position, :y_position )
  end

  class Food < Coord
  end

  class Snake < Struct.new( :positions )
  end

  class Grid < Struct.new( :rows, :cols )
  end

  class State < Struct.new( :grid, :snake, :food, :next_direction, :game_finished )
  end

  def self.initial_state
    # Grid
    grid = self::Grid.new( CONFIGS[ "rows" ], CONFIGS[ "cols" ] )

    # Food
    food = self::Food.new(
      rand( CONFIGS[ "cols" ] ),
      rand( CONFIGS[ "rows" ] )
    )

    # Snake
    snake = self::Snake.new( [
      self::Coord.new( 1, 1 ),
      self::Coord.new( 2, 1 )
    ] )

    # Next Direction
    next_direction = Directions::RIGHT

    # Construct state
    self::State.new( grid, snake, food, next_direction, false )
  end
end
