require 'pry'

require_relative 'cult.rb'
require_relative 'bloodoath.rb'
require_relative 'follower.rb'

cult1 = Cult.new("Manson Family", "LA", 1969, "Helter Skelter")
cult2 = Cult.new("Peoples Temple", "Jonestown", 1950, "Yumm kool-aid")

follower1 = Follower.new("Charlie", 17, "F**k the system")
follower2 = Follower.new("Jane", 51, "I just want to end it all")

cult1.recruit_follower(follower1)
follower2.join_cult(cult2)
binding.pry