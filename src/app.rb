require_relative "views/game_view"
require_relative "models/state"

class SnakeApp
  def start
    game_view = View::GameView.new()
    initial_state = Model::initial_state

    puts "Game Running!"
    game_view.render( initial_state )

    def init_timer
      loop do
        sleep 0.5
      end
    end
  end
end

game = SnakeApp.new

# Initialize game
game.start


# Figures
=begin
Triangle.new(
  x1: 320, y1:  50,
  x2: 540, y2: 430,
  x3: 100, y3: 430,
  color: ['red', 'green', 'blue']
)
=end

# @fig1 = Square.new( x: 50, y: 50, size: 15, color: 'red' )

# update do
#   @fig1.x += @x_speed
#   @fig1.y += @y_speed
# end

# Sprites
# coin = Sprite.new(
#   'assets/img/coin.png',
#   clip_width: 84,
#   time: 80,
#   loop: true
# )

# person = Sprite.new(
#   'assets/img/person-walk.png',
#   clip_width: 103,
#   time: 80,
#   loop: true
# )

# animation_1 = Sprite.new(
#   'assets/img/animation-1.png',
#   clip_width: 134.230769231,
#   time: 170,
#   loop: true
# )

# dog_animation = Sprite.new(
#   'assets/img/dog.png',
#   clip_width: 134.230769231,
#   clip_height: 200,
#   time: 170,
#   loop: true
# )

# street_fighter_animation = Sprite.new(
#   'assets/img/street-fighter.png',
#   # width: 288.000
#   clip_width: 72.0000,
#   clip_height: 80.000,
#   time: 80,
#   loop: true
  # count: [
  #   {
  #     x: 0, y: 0,
  #     width: 72,height: 80
  #   }
  # ]
# )

# street_fighter_animation.play animation: count, loop: true
# street_fighter_animation.play

# update do
#   coin.x += @x_speed
#   coin.y += @y_speed
# end

