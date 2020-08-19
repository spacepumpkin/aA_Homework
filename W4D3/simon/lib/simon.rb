require 'colorize'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until self.game_over
    game_over_message
    reset_game
  end

  def take_turn
    system("clear")
    puts "Round #{sequence_length}. Get ready."
    sleep(2)

    show_sequence
    puts "Please enter the sequence of colors you saw (separated by spaces): "
    self.game_over = true unless require_sequence == self.seq

    unless self.game_over
      round_success_message
      sleep(2)
      self.sequence_length += 1
    end
  end

  def show_sequence
    spaces = 0

    self.sequence_length.times do |i|
      system("clear")
      puts "(don't type anything yet)"
      print " " * spaces
      
      add_random_color if i == self.sequence_length - 1
      
      current_color = self.seq[i]
      case current_color
      when "red"; spaces += 3; puts current_color.red; # system("clear"); puts current_color.red
      when "blue"; spaces += 4; puts current_color.blue; # system("clear"); puts current_color.blue
      when "green"; spaces += 5; puts current_color.green; # system("clear"); puts current_color.green
      when "yellow"; spaces += 6; puts current_color.yellow; # system("clear"); puts current_color.yellow
      end
      sleep(1.5)
    end
    system("clear")
  end

  def require_sequence
    input = gets.chomp.split(" ")
    if input.any? { |color| !COLORS.include?(color) }
      raise Typo, "Possible typo! (available colors: red, blue, green, yellow)" 
    end
    input 

    rescue StandardError => e
      # system("clear")
      puts e
      puts "Please enter the sequence of colors you saw (separated by spaces): "
      retry
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "Awesome! Keep going 'til you drop."
  end

  def game_over_message
    puts "GAME OVA. You made it to #{sequence_length} rounds!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

class Typo < StandardError ; end

if __FILE__ == $PROGRAM_NAME

  newgame = Simon.new
  newgame.play


end