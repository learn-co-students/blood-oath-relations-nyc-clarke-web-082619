require 'pry'

class Cult 

    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan 
        @@all << self
    end 

    def recruit_follower(follower)
        BloodOath.new(follower, self)
    end 

    def bloodoaths
        BloodOath.all.select {|bloodoath| bloodoath.cult == self}
    end 

    def followers
        self.bloodoaths.map {|bloodoath| bloodoath.follower}
    end 

    def cult_population
        self.followers.length 
    end 

    def self.all
        @@all
    end 

    def self.find_by_name(name)
        self.all.find {|cult| cult.name == name }
    end 

    # binding.pry 

    def self.find_by_location(location)
        self.all.find {|cult| cult.location == location}
    end 

    def self.find_by_founding_year(founding_year)
        self.all.select {|cult| cult.founding_year == founding_year}
    end 

    def average_age
        
    end

end 