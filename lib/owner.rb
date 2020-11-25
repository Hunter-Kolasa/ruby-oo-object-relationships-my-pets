class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name, species = "human")
    @name = name
    @species = species
    save

  end
  def save
    @@all << self
  end
  def say_species
    "I am a #{@species}."
  end
  def self.all
    @@all
  end
  def self.count
    @@all.size
  end
  def self.reset_all
    @@all.clear
  end
  def cats
    Cat.all.select  {|cat| cat.owner == self}
  end
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  def buy_cat(name)
    Cat.new(name, self)
  end
  def buy_dog(name)
    Dog.new(name, self)
  end
  def walk_dogs
    self.dogs.each {|doggo| doggo.mood = "happy"}
  end
  def feed_cats
    self.cats.each {|catto| catto.mood = "happy"}
  end
  def sell_pets
    self.cats.each {|catto| catto.mood = "nervous"}
    self.cats.each {|catto| catto.owner = nil}
    self.dogs.each {|doggo| doggo.mood = "nervous"}
    self.dogs.each {|doggo| doggo.owner = nil}
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end