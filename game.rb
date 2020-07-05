require_relative './player'
require_relative './board'

class Game
  WIN_CONDITIONS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  def initialize
    @player_1 = Player.new('X', "Player 1")
    @player_2 = Player.new('0', "Player 2")
    @board = Board.new
    @players_choices = []
  end

  def update_choices(player, location)
    player.add_choice(location)
    @players_choices.push(location)
  end

  def end?(player)
    WIN_CONDITIONS.any? { |win_condition| (win_condition - player.choices) == []}
  end

  def start
    for i in 0..8
      i % 2 == 0 ? current_player = @player_1 : current_player = @player_2

      location = current_player.mark

      while @players_choices.include?(location)
				puts "That number has been taken, please choose another number!"
				@board.show
				location = current_player.mark
      end
      
      update_choices(current_player, location)
      marker = current_player.marker
      @board.update(location, marker)
      @board.show

      if end?(current_player)
				puts "Congratulations! #{current_player.name} wins!"
				break
			end
    end
  end
end

game = Game.new
game.start
