class Monster  # Define the monster class
  attr_reader :name, :actions
  def initialize(name)
    @name = name # instance variable
    @actions = {  # create an actions hash to hold various values
      screams_count: 0,
      scare_count: 0,
      runs: 0,
      hidden_count: 0,

    }
  end

  def say(&block)  # define the say method, determines what the monster will say
    print "#{name} says... \n"
    yield
  end

  def scream(&block) # defines the type of scream for the monster
    actions[:screams_count] += 1  # calls the actions hash,
                              # increments the 'screams_count' key, value by one.
    print "#{name} screams at you!! "
    yield
  end

  def scare(&block) # defines the type of scare for the monster
    actions[:scare_count] += 1  # calls the actions hash,
                              # increments the 'scare_count' key, value by one.
    print "#{name} scares you and yells, "
    yield
  end

  def run(&block) # defines the monster running
    actions[:runs] += 1  # calls the actions hash,
                              # increments the 'runs' key, value by one.
    print "#{name} then runs after you!!\n"
    yield
  end

  def hide(&block) # defines the monster hidding from user
    actions[:hidden_count] += 1  # calls the actions hash,
                              # increments the 'hidden_count' key, value by one.
    print "Now #{name} is hidding from you!!\n"
    yield
  end

  def print_scoreboard
    puts "-" * 40
    puts "#{name} scoreboard"
    puts "-" * 40
    puts "- screams_count: #{actions[:screams_count]}"
    puts "- scare_count: #{actions[:scare_count]}"
    puts "- runs: #{actions[:runs]}"
    puts "- hidden_count: #{actions[:hidden_count]}"
    puts "-" * 40
  end

  monster = Monster.new("Rex")  # new instance of monster

  monster.say do  # call the say method, pass in saying of the monster
    puts "What are you doing in my house??"
    puts "\n"
  end

# puts "#{monster.actions} \n"
  monster.scream do # call the scream method and pass in scream sound.
    puts "RRRRrrrrrrrr!!!!!"
  end

monster.scare do
  puts "'run for your life or I'll eat you'!!!!"
  puts "\n"
end

monster.run do
  puts "You manage to outrun the monster this time, however next you might not be so lucky!"
  puts "\n"
end

monster.hide do
  puts "You start yelling... 'here monster monster, come out where ever you are!!'
  "
end

# puts monster.actions
puts "\n"
puts "CURRENT MONSTER SCOREBOARD IS: "
monster.print_scoreboard




end
