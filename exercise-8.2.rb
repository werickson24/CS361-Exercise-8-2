class Poker
  def initialize(players)
    @players = players
    @hands = []
    initialize_players
  end

  def initialize_players
    @players.length().times { |x| @hands.append(nil) }
  end

  def play_poker()
    puts "Players in the poker game:"
    @players.length().times { |i| puts "#{self.get_player_name(i)}: #{self.get_player_hand(i)}" }
    # [pretend there's code here]
  end

  def get_results()
    return "[pretend these are poker results]"
  end

  def get_player_name(i)
    return @players[i]
  end

  def get_player_hand(i)
    return @hands[i]
  end
end

class Chess
  def initialize(players)
    @players = players
  end

  def play_game()
    puts "Players in the chess game:"
    @players.each { |name, color| puts "#{name}: #{color}"}
    # [pretend there's code here]
  end

  def get_results()
    return "[pretend these are chess results]"
  end

  def get_player_name(i)
    @players[i][0]
  end
end

class GoPlayer
  attr_reader :name, :color

  def initialize(name:, color:)
    @name = name
    @color = color
  end
end

class Go
  def initialize(players)
    @players = []
    create_players(players)
  end
  
  def create_players(players)
    players.each { |name, color| @players.append(create_go_player(name, color)) }
  end
  
  # wrap outside class
  def create_go_player(name, color)
    GoPlayer.new(name: name, color: color)
  end
  
  def play()
    puts "Players in the go game:"
    @players.each { |player| puts "#{player.name}: #{player.color}" }
    # [pretend there's code here]
  end

  def get_score()
    return "[pretend these are go results]"
  end
end

# We really don't need this whole class anyways, but it seems like a fair way to handle events for this situation, separate game functions would be best
# though this class both has lots of dependencies, and uses flags, wrapping the functions can help this function be cleaner
class PlayGames

  def initialize(game_name:, player_list:)
    @player_list = player_list
    @game_name = game_name
  end
  
  def play_poker()
    poker = Poker.new(@player_list)
    poker.play_poker()
    puts poker.get_results()
  end

  def play_chess()
    chess = Chess.new(@player_list)
    chess.play_game()
    puts chess.get_results()
  end
  
  def play_go()
    go = Go.new(@player_list)
    go.play()
    puts go.get_score()
  end
  
  def play()
    case @game_name
    when "poker"
      play_poker
    when "chess"
      play_chess
    when "go"
      play_go
    end
  end
  
end

pg = PlayGames.new(game_name: "poker", player_list: ["alice", "bob", "chris", "dave"])
pg.play()

puts

pg = PlayGames.new(game_name: "chess", player_list: [["alice", "white"], ["bob", "black"]])
pg.play()

puts

pg = PlayGames.new(game_name: "go", player_list: [["alice", "white"], ["bob", "black"]])
pg.play()

