require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name
    species
    @@all << self
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.select {|pup| pup.mood = "happy" if pup.owner == self}
  end

  def feed_cats
    Cat.all.select {|kitten| kitten.mood = "happy" if kitten.owner == self}
  end

  def sell_pets
    
    owners_pets = [*find_pets]
    owners_pets.each { |pet| pet.mood = "nervous"; pet.owner = nil}
  end

  def list_pets
    find_pets
    "I have #{@dogs.length} dog(s), and #{@cats.length} cat(s)."
  end

  def find_pets
    pets = []
    @cats = Cat.all.select {|kitten| kitten.owner == self}
    @dogs =  Dog.all.select {|pup| pup.owner == self}
    pets += @cats + @dogs
  end
end