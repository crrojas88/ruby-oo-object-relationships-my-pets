require 'pry'
class Owner

  @@all = []

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  attr_reader :name, :species

  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
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
    self.dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    all_pets = self.dogs + self.cats
    all_pets.map {|pet| pet.mood, pet.owner = "nervous", nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end