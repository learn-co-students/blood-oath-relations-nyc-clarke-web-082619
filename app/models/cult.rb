class Cult
    attr_reader :founding_year, :minimum_age
    attr_accessor :name, :location, :slogan

    @@all = []

  def initialize(name, location, founding_year, slogan, minimum_age)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(cult_name)
    self.all.select{|cults| cults.name == cult_name}
  end

  def self.find_by_location(cult_location)
    self.all.find{|cults| cults.location == cult_location}
  end

  def self.find_by_founding_year(year)
    self.all.select{|cults| cults.founding_year == year}
  end

  def self.least_popular
    popularity_hash = {}
    self.all.each{|cult| popularity_hash[cult] = cult.cult_population} 
    popularity_hash.sort_by{|k,v| v}.first[0]
  end

  def self.most_common_location
    location_hash = Hash.new(0)
    self.all.each{|cult| location_hash[cult.location] += 1}
    location_hash.sort_by{|k,v| v}.last[0]
  end

  def recruit_follower(follower, initiation_date)
     if self.minimum_age > follower.age 
      return "Sorry, you must be #{cult.minimum_age} to join!"
    end
    BloodOath.new(initiation_date, self, follower)
  end

  def one_of_us
    BloodOath.all.select{|oaths| oaths.cult == self}
  end

  def cult_population
    one_of_us.length
  end

  def average_age
    age_sum = one_of_us.map{|member| member.follower.age}.sum
    age_sum.to_f / cult_population
  end

  def my_followers_mottos
    one_of_us.map{|member| member.follower.life_motto}
  end


end