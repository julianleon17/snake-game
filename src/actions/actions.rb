require_relative '../models/state'

module Actions
  # Access Control
  private :cal_next_position, :position_is_valid?, :move_to, :end_game

  def self.move_snake( state )
    next_direction = state.next_direction
    next_position = cal_next_position( state )

    if position_is_valid?( state, next_position )
      # ...
      move_to( state, next_position )
    else
      end_game( state )
      # ...
    end
  end

  def cal_next_position( state )
    current_position = state.snake.positions.first
    new_position = nil
    move_speed = 2
    @x_speed = 0
    @y_speed = 0

    # Clickboard
    on :key_down do |event|
      puts event.type

      case event.key
        when 'd', 'right' then # x
          @x_speed = 2
          @y_speed = 0

          new_position = Model::Coord.new(
            current_position.x_position + move_speed,
            current_position.y_position
          )
        when 'a', 'left' then
          @x_speed = -2
          @y_speed = 0

          new_position = Model::Coord.new(
            current_position.x_position - move_speed,
            current_position.y_position
          )
        when 'w', 'up' then # y
          @y_speed = -2
          @x_speed = 0

          new_position = Model::Coord.new(
            current_position.x_position,
            current_position.y_position - move_speed
          )
        when 's', 'down' then
          @y_speed = 2
          @x_speed = 0

          new_position = Model::Coord.new(
            current_position.x_position,
            current_position.y_position + move_speed
          )
      end
    end

    new_position
  end

  def position_is_valid?( state, next_position )
    is_valid = true

    if ( (next_position.x_position >= state.grid.rows) || (next_position.x_position < 0) )
      is_valid = false
    end

    if ( (next_position.y_position >= state.grid.cols) || (next_position.y_position < 0) )
      is_valid = false
    end

    # Check that the snake does not overlap
    if is_valid
      return !(state.snake.positions.include? next_position)
    else
      return false
    end
  end

  def move_to( state, next_position )
    new_positions = [ next_position ] + state.snake.positions[0...-1]
    state.snake.positions = new_positions
    state
  end

  def end_game( state )
    state.game_finished = true
    state
  end
end

=begin
  def self.cal_next_position( state )
    current_position = state.snake.positions.first
    new_position = nil
    move_speed = 2
    @x_speed = 0
    @y_speed = 0

    # Clickboard
    on :key_down do |event|
      puts event.type

      case event.key
        when 'd', 'right' then # x
          @x_speed = 2
          @y_speed = 0
        when 'a', 'left' then
          @x_speed = -2
          @y_speed = 0
        when 'w', 'up' then # y
          @y_speed = -2
          @x_speed = 0
        when 's', 'down' then
          @y_speed = 2
          @x_speed = 0
      end

      # state.snake.positions

      state.snake.x += @x_speed
      state.snake.y += @y_speed
    end
=end
