require_relative "view/ruby2d"
require_relative "model/state"
require_relative "actions/actions"

class App
  def initialize
    @state = Model::initial_state
    @view = View::Ruby2dView.new( self )
  end

  def start
    timer_thread = Thread.new { init_timer( @view ) }

    # Init view
    @view.start( @state )
    timer_thread.join
  end

  def init_timer( view )
    loop do
      if @state.game_finished
        score = @state.snake.positions.length
        puts "GAME OVER!"
        puts "Score: #{score}"
        break
      end

      @state = Actions::move_snake( @state )
      view.render_view( @state )
      sleep 0.08
    end
  end

  def send_action( action, params )
    new_state = Actions.send( action, @state, params )

    if new_state.hash != @state.hash
      @state = new_state
      @view.render_view( @state )
    end
  end
end

snake_game = App.new

snake_game.start
