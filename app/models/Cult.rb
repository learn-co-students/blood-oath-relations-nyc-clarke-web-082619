class Cult
    attr_accessor :name, :location, :founding_year, :slogan, :minimum_age

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
        @minimum_age = 18
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        if !followers.include?(follower) && follower.age >= minimum_age
        BloodOath.new(self, follower)
        elsif follower.age < minimum_age
            "Sorry, #{follower.name} is too young to join."
        else
            "#{follower.name} has already joined!"
        end
    end

    def followers
        BloodOath.all.select {|bo| bo.cult == self}.map {|bo|bo.follower}
    end

    def cult_population
       followers.length
    end

    def self.find_by_name(name)
       @@all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        @@all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        @@all.select {|cult| cult.founding_year == founding_year}
    end
    def average_age
        sum = followers.reduce(0) {|start, f| start+ f.age}.to_f
        sum/followers.length
    end

    def my_followers_mottos
        followers.map {|f|f.life_motto}
    end

    def self.least_popular
        @@all.min {|c1,c2| c1.cult_population <=> c2.cult_population}
    end

    def self.most_common_location
        hash = @@all.reduce({}) do |start, cult|
            start[cult.location] ||= 0
            start[cult.location] += 1
            start
        end
        hash.key(hash.values.max)
    end

end