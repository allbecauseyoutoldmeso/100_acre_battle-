class Game

  attr_reader :current_turn, :opponent

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
    @opponent = player_2
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

# potentially refactor and extract attack class
  def attack(player)
    player.receive_damage
  end

  def finish?
    player_1.hp <= 0 || player_2.hp <= 0
  end

  def switch_turn
    if current_turn == player_1
      self.current_turn = player_2
      self.opponent = player_1
    else
      self.current_turn = player_1
      self.opponent = player_2
    end
  end

  private

  attr_writer :players, :current_turn, :opponent


end
