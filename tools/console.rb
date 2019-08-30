require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
cult1 = Cult.new('Ultra Creepy', 'NYC', 2006, 'we creep')
cult2 = Cult.new('Undies Bois', 'NYC', 1900, 'sup?')
cult3 = Cult.new('y2k gang', 'LA', 2000, 'the machines are taking over')
cult4 = Cult.new('Killers', 'LA', 2100, 'sup?')
cult5 = Cult.new('Succubi', 'Chicago', 1980, 'drink up')
cult6 = Cult.new('WacoWaco', 'Chicago', 1990, 'the devils chill')


follower1 = Follower.new('Chris', 12, 'hate u dad')
follower2 = Follower.new('Brenda', 35, 'bring back charles manson')
follower3 = Follower.new('Keanu', 24, 'death to America')
follower4 = Follower.new('Deedee', 30, 'men r cancelled')
follower5 = Follower.new('Mary', 11, 'if u wanna b my lover')
follower6 = Follower.new('Angel', 84, 'gotta get with my friends')

cult1.recruit_follower(follower6, '2001-09-11')
cult1.recruit_follower(follower5, '2001-09-12')
cult1.recruit_follower(follower4, '2001-09-13')
cult1.recruit_follower(follower3, '2001-09-14')
cult1.recruit_follower(follower2, '2001-09-15')
cult1.recruit_follower(follower1, '2001-09-16')

cult2.recruit_follower(follower5, '2001-09-12')
cult2.recruit_follower(follower4, '2001-09-12')
cult2.recruit_follower(follower3, '2001-09-12')
cult2.recruit_follower(follower2, '2001-09-12')
cult2.recruit_follower(follower1, '2001-09-12')


cult3.recruit_follower(follower4, '2001-09-13')
cult3.recruit_follower(follower3, '2001-09-13')
cult3.recruit_follower(follower2, '2001-09-13')
cult3.recruit_follower(follower1, '2001-09-13')

cult4.recruit_follower(follower3, '2001-09-14')
cult4.recruit_follower(follower2, '2001-09-14')
cult4.recruit_follower(follower1, '2001-09-15')

cult5.recruit_follower(follower2, '2001-09-15')
cult5.recruit_follower(follower1, '2001-09-15')

cult6.recruit_follower(follower1, '2001-09-15')



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
