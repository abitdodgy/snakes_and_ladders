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

      if board.move(player, player.position, player.destination_after_last_roll)
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
      player.position.equal?(board.size)
    end

    def will_win?
      player.destination_after_last_roll >= board.size
    end

    def winner=(player)
      @winner = player
      puts "Game over! #{winner} wins in #{winner.turns} turns. Congratulations!"
    end
  end
end
