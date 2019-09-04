class Follower

    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        # @cults = cults
        @@all << self
    end 

    def join_cult(cult)
        BloodOath.new(self, cult)
    end 

    def self.all
        @@all
    end 

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age == age}
    end 


end 