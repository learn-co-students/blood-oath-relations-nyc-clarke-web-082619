require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

today = "2019-09-03"

c1 = Cult.new("Rick and Morty Fan Club", "Los Angeles", "I'm Pickle Rick", 2016, 10)
c2 = Cult.new("Vector Marketing", "Olean, NY", "It's not a scam", 1981, 16)
c3 = Cult.new("Illuminati", "Bavaria", "Annuit Coeptis", 1776, 18)
c4 = Cult.new("Scientology", "Los Angeles", "Hail Tom Cruise", 1980, 7)

f1 = Follower.new("Jack", 26, "No matter where you go, there you are")
f2 = Follower.new("Alice", 33, "You're the crazy ones")
f3 = Follower.new("Bob", 41, "Don't step on me")
f4 = Follower.new("Paul", 8, "I am the chosen one")

b1 = BloodOath.new(f1, c2, "2008-08-08")
b2 = BloodOath.new(f3, c3, "1990-01-01")
b3 = BloodOath.new(f1, c1, "2017-11-23")
b4 = BloodOath.new(f2, c1, "2018-06-12")
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
