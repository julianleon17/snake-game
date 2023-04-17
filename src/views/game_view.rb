require 'ruby2d'
require_relative "../../configs"

module View
  class GameView
    def initialize
      @configs = Configs::CONSOLE_CONFIGS
    end

    def render ( state )
      extend Ruby2D::DSL

      # Configs
      set( {
        :title => @configs[ "title" ],
        :background => @configs[ "background" ],
        :diagnostics => @configs[ "diagnostics" ],
        :resizable => @configs[ "resizable" ],
        :width => @configs[ "pixel_size" ] * state.grid.cols,
        :height => @configs[ "pixel_size" ] * state.grid.rows
      } )

      # Render objects
      render_food( state )
      render_snake( state )

      # Show App
      show
    end

    def render_food ( state )
      food = state.food
      color = 'orange'

      # Creating the food
      Square.new(
        x: food.x_position * @configs[ "pixel_size" ],
        y: food.y_position * @configs[ "pixel_size" ],
        size: @configs[ "pixel_size" ],
        color: color,
      )
    end

    def render_snake ( state )
      snake = state.snake
      color = 'green'

      # Creating each part of the snake
      snake.positions.each do | position |
        Square.new(
          x: position.x_position * @configs[ "pixel_size" ],
          y: position.y_position * @configs[ "pixel_size" ],
          size: @configs[ "pixel_size" ],
          color: color,
        )
      end
    end
  end
end
