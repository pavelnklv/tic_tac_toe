class Player
  attr_reader :marker, :name, :choices
  def initialize(marker, name)
    @marker = marker
    @name = name
    @choices = []
  end

  def mark
    location = 0
    until location > 0 && location < 10
      puts "Please, choice number from 1 to 9: "
      location = gets.chomp.to_i
    end
    location
  end

  def add_choice(location)
    @choices.push(location)
  end
end

# p = Player.new('X', 'Pavel')
# loc = p.mark
# p.add_choice(loc)
# loc = p.mark
# p.add_choice(loc)

# print p.choices