require "ruby2d"
require_relative "../../configs"
require_relative "../model/state"

module View
  class Ruby2dView
    def initialize( app )
      @app = app
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

      # Clickboard
      on :key_down do | event |
        # puts event.key
        handle_key_event( event.key )
      end

      # Show App
      show
    end

    def render_view( state )
      extend Ruby2D::DSL

      close if state.game_finished

      # Render objects
      render_food( state )
      render_snake( state )
    end

    private

    def render_food( state )
      extend Ruby2D::DSL
      @food.remove if @food

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
      extend Ruby2D::DSL
      # if @snake_positions
      #   @snake_positions.each do |position|
      #     position.remove
      #   end
      # end

      # This line do the same thing that the previous block
      @snake_positions.each( &:remove ) if @snake_positions

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

    def handle_key_event( key )
      case key
        when 'left', 'a'
          @app.send_action( :change_direction, Model::Direction::LEFT )
        when 'right', 'd'
          @app.send_action( :change_direction, Model::Direction::RIGHT )
        when 'up', 'w'
          @app.send_action( :change_direction, Model::Direction::UP )
        when 'down', 's'
          @app.send_action( :change_direction, Model::Direction::DOWN )
      end
    end
  end
end
