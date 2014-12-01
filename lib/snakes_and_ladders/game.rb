module SnakesAndLadders
  class Game
    attr_reader :board, :players, :winner, :turn, :player

    def initialize(board:, players: [], turn: 0)
      @board = board
      @players = players
      @turn = turn
    end

    def add_player(player)
      players.push(player)
    end

    def play_turn
      return if over?

      init_turn

      puts "#{player} rolls #{player.last_roll}!"

      if board.move(player, player_position, player_destination_after_last_roll)
        self.winner = player if won?
      else
        self.winner = player if will_win?
      end
    end

    def over?
      !!winner
    end

    def simulate
      play_turn until over?
    end

  private

    def init_turn
      @player = players.at(turn % players.size)
      @player.roll_die
      @turn += 1
    end

    def won?
      player_position.equal?(board_size)
    end

    def will_win?
      player_destination_after_last_roll >= board_size
    end

    def winner=(player)
      @winner = player
      puts "Game over! #{winner} wins in #{winner.turns} turns. Congratulations!"
    end

    def player_position
      player.position
    end

    def player_destination_after_last_roll
      player.destination_after_last_roll
    end

    def board_size
      board.size
    end
  end
end
