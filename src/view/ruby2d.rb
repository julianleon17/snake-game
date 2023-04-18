require "ruby2d"
require_relative "../../configs"
require_relative "../model/state"

module View
  class Ruby2dView
    def initialize
      @configs = Configs::CONSOLE_CONFIGS
      @pixel_size = @configs[ "pixel_size" ]
    end

    def start( state )
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

      # Show App
      show
    end

    def render_view( state )
      # Render objects
      render_food( state )
      render_snake( state )
    end

    private

    def render_food( state )
      @food.remove if @food

      extend Ruby2D::DSL

      food = state.food
      color = "yellow"

      @food = Square.new(
        x: food.col * @pixel_size,
        y: food.row * @pixel_size,
        size: @pixel_size,
        color: color
      )
    end

    def render_snake( state )
      # if @snake_positions
      #   @snake_positions.each do |position|
      #     position.remove
      #   end
      # end

      # This line do the same thing that the previous block
      @snake_positions.each( &:remove ) if @snake_positions

      extend Ruby2D::DSL

      snake = state.snake
      color = "green"

      @snake_positions = snake.positions.map do |position|
        Square.new(
          x: position.col * @pixel_size,
          y: position.row * @pixel_size,
          size: @pixel_size,
          color: color
        )
      end
    end
  end
end
