require 'date'
class Cult
    attr_accessor :name, :location, :slogan, :min_age
    attr_reader :founding_year

    @@all = []

    def initialize(name, location, slogan, founding_year, min_age)
        @name = name
        @location = location
        @slogan = slogan
        @founding_year = founding_year
        @min_age = min_age

        @@all << self
    end

    def blood_oaths
        BloodOath.all.select{|oath| oath.cult == self}
    end

    def followers
        blood_oaths.map{|oath| oath.follower}.uniq
    end

    def cult_population
        followers.length
    end

    def recruit_follower(follower)
        if follower.age >= self.min_age then
            BloodOath.new(follower, self, Date.today.to_s)
        else
            "This one is too young to join our cult"
        end
    end

    def average_age
        followers.sum{|follower| follower.age}.to_f/cult_population
    end

    def my_folllowers_mottos
        followers.map{|follower| follower.life_motto}
    end

    def self.least_popular
        # current_leader = all[0]

        # all.each do |cult|
        #     if cult.cult_population < current_leader.cult_population then
        #         current_leader = cult
        #     end
        # end
        # current_leader

        sorted_cults = all.sort_by{|cult| cult.cult_population}
        sorted_cults[0]
    end

    def self.most_common_location
        locations = all.map{|cult| cult.location}
        mode(locations)
    end

    def self.find_by_name(name)
        all.find{|cult| cult.name == name}
    end

    def self.find_by_location(location)
        all.select{|cult| cult.location == location}
    end

    def self.mode(array)
        array.group_by{ |e| e }.group_by{ |k, v| v.size }.max.pop.map{ |e| e.shift }
    end

    def self.find_by_founding_year(year)
        all.select{|cult| cult.founding_year == year}
    end

    def self.all
        @@all
    end
end