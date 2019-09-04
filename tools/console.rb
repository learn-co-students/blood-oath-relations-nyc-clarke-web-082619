require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


# cult1 = Cult.new("Manson Family", "LA", 1969, "Helter Skelter")
# cult2 = Cult.new("Peoples Temple", "Jonestown", 1950, "Yumm kool-aid")

# follower1 = Follower.new("Charlie", 17, "F**k the system")
# follower2 = Follower.new("Jane", 51, "I just want to end it all")

# cult1.recruit_follower(follower1)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
