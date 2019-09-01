class Follower
    attr_accessor :name, :age, :life_motto
    @@all = []
    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
        BloodOath.all.select {|bo|bo.follower == self}.map {|bo|bo.cult}
    end
    
    def join_cult(cult)
        if !cults.include?(cult) && age >= cult.minimum_age
            BloodOath.new(cult, self)
        elsif age < cult.minimum_age
            "Sorry, you're too young to join."
        else
            "#{name} has already joined!"
        end
    end

    def self.of_a_certain_age(age)
        @@all.select {|f|f.age >= age}
    end

    def self.all
        @@all
    end

    def my_cults_slogans
        cults.map {|cult|cult.slogan}
    end

    def self.most_active
        @@all.max_by {|follower|follower.cults.length}
    end

    def self.top_ten
        @@all.sort_by {|follower|-follower.cults.length}.first(10)
    end

    def fellow_cult_members
        cults.map {|cult| cult.followers}.flatten.uniq - [self]
    end
end