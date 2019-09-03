class Cult
    attr_accessor :name, :location, :founding_year, :slogan
    @@all = []
    def initialize(name,location,founding_year,slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def recruit_follower(follower)
        BloodOath.new(Time.now.strftime("%F"), follower, self)
    end

    def followers
        BloodOath.all.select{|x| x.cult == self}.map{|y| y.follower}
    end

    def cult_population
        BloodOath.all.select{|x| x.cult == self}.length
    end

    def average_age
        (followers.map{|x| x.age}.sum.to_f)/cult_population
    end

    def my_followers_mottos
        followers.each{|x| puts x.life_motto}
    end

    def self.all
        @@all
    end

    def self.find_by_name(n)
        @@all.find{|x| x.name == n}
    end

    def self.find_by_location(l)
        @@all.select{|x| x.location == l}
    end

    def find_by_founding_year(y)
        @@all.select{|x| x.founding_year == y}
    end

    def self.least_popular
        @@all.sort_by{|x| x.cult_population}[0]
    end

    def self.most_common_location
        arr = @@all.map{|x| x.location}
        return arr.max_by{|y| arr.count(y)}
    end
end