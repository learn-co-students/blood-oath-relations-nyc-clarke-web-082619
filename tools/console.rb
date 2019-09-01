require_relative '../config/environment.rb'
# require "Time"

def reload
  load 'config/environment.rb'
end
c1 = Cult.new("Red", "NYC", 1980, "slogan1")
c2 = Cult.new("Blue", "Tokyo", 1990, "slogan2")
c3 = Cult.new("Green", "NYC", 2005, "slogan3")

f1 = Follower.new("Megan", 29, "motto1")
f2 = Follower.new("Renea", 45, "motto2")
f3 = Follower.new("Stokes", 12, "motto3")
f4 = Follower.new("Edmonds", 30, "motto4")

b1 = BloodOath.new(c1,f1)
b2 = BloodOath.new(c1,f2)
b3 = BloodOath.new(c2,f3)
b4 = BloodOath.new(c2,f4)
b5 = BloodOath.new(c3,f1)
b6 = BloodOath.new(c1,f4)
b7 = BloodOath.new(c2,f1)
b4 = BloodOath.new(c3,f2)
b5 = BloodOath.new(c2,f2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
