require_relative "../../configs"

module Model
  CONFIGS = Configs::CONSOLE_CONFIGS

  module Direction
    UP = :up
    RIGHT = :right
    DOWN = :down
    LEFT = :left
  end

  class Coord < Struct.new( :row, :col )
  end

  class Food < Coord
  end

  class Snake < Struct.new( :positions )
  end

  class Grid < Struct.new( :rows, :cols )
  end

  class State < Struct.new( :snake, :food, :grid, :current_direction, :game_finished )
  end

  def self.initial_state
    # Grid
    grid = Model::Grid.new( CONFIGS[ "rows" ], CONFIGS[ "cols" ] )

    # Food
    food = Model::Food.new(
      rand( CONFIGS[ "rows" ] ),
      rand( CONFIGS[ "cols" ] )
    )

    # Snake
    snake = Model::Snake.new( [
      Model::Coord.new( 1, 1 ),
      Model::Coord.new( 0, 1 )
    ] )

    # Next Direction
    current_direction = Direction::DOWN

    # Model::State.new(
    #     Model::Snake.new([
    #         Model::Coord.new(1,1),
    #         Model::Coord.new(0,1)
    #     ]),
    #     Model::Food.new(4, 4),
    #     Model::Grid.new(8, 12),
    #     Direction::DOWN,
    #     false
    # )
    Model::State.new( snake, food, grid, current_direction, false )
  end
end
