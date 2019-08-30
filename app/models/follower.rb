class Follower
  attr_reader :name, :age
  attr_accessor :life_motto

  @@all = []

  def initialize(name, age, life_motto)
    @name = name 
    @age = age 
    @life_motto = life_motto
    @@all << self
  end

  def self.all 
    @@all 
  end

  def self.of_a_certain_age(age)
    self.all.select{|followers| followers.age >= age }
  end

  def self.user_activity
    cult_hash = {}
    self.all.each{|follower| cult_hash[follower] = follower.cults.length}
    cult_hash.sort_by{|k,v| v}
  end

  def self.most_active
    user_activity.last[0]
  end

  def self.top_ten
    top_array = []
    user_activity.reverse.each do |user|
    top_array << user 
    end
    top_array[0..9]
  end

  def join_cult(cult, initiation_date)
    BloodOath.new(initiation_date, cult, self)
  end

  def cults 
    BloodOath.all.select{|oaths| oaths.follower == self}
  end

  def my_cult_slogans
    cults.map{|cults| cults.cult.slogan}
  end




end