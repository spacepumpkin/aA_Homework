class Board
  attr_accessor :cups

  def initialize(name1, name2)
    num_stones = 4
    @cups = Array.new(14) do 
      arr = []
      num_stones.times { arr << :stone }
      arr
    end
    @cups[6] = []
    @cups[13] = []
    @name1 = name1 #(0..6).to_a
    @name2 = name2 #(7..13).to_a
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (0..13).include?(start_pos)
    raise "Starting cup is empty" if self.cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    # :prompt if ending in own cup
    # ending_cup_idx if ending in cup with stones
    # :switch if ending in an empty cup
    selected_stones = self.cups[start_pos].shift(self.cups[start_pos].size)
    current_pos = start_pos
    player_cup = ( current_player_name == @name1 ? 6 : 13 )
    opponent_cup = ( current_player_name == @name1 ? 13 : 6 )

    until selected_stones.empty?
      current_pos = (current_pos + 1) % 14
      current_pos = (current_pos + 1) % 14 if current_pos == opponent_cup
      self.cups[current_pos] << selected_stones.shift
    end
    self.render

    self.next_turn(current_pos)
    # return result == :switch
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if [6,13].include?(ending_cup_idx)
    return :switch if self.cups[ending_cup_idx].length == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0...6).all? { |i| self.cups[i].empty? } || 
    (7...13).all? { |i| self.cups[i].empty? }
  end

  def winner
    case self.cups[6] <=> self.cups[13]
    when 1
      return @name1
    when -1
      return @name2
    else
      return :draw
    end
  end
end
