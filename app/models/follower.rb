require 'date'

class Follower
    attr_reader :name
    attr_accessor :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    def blood_oaths
        BloodOath.all.select{|oath| oath.follower == self}
    end

    def cults
        blood_oaths.map{|oath| oath.cult}.uniq
    end

    def join_cult(cult)
        if self.age >= cult.min_age then
            BloodOath.new(self, cult, Date.today)
        else
            "This one is too young to join this cult"
        end
    end
    
    def my_cults_slogans
        cults.map{|cult| cult.slogan}
    end

    def num_cults
        cults.length
    end

    def fellow_cult_members
        fellows = []
        cults.each do |cult|
            cult.followers.each do |follower|
                fellows << follower if !fellows.include?(follower)
            end
        end
        fellows
    end

    def self.most_active
        current_leader = all[0]
        all.each do |follower|
            if follower.cults.length > current_leader.cults.length then
                current_leader = follower
            end
        end
        current_leader
    end

    def self.top_ten
        sorted_followers = all.sort_by{|follower| follower.num_cults}
        if sorted_followers.length >= 10 then
            sorted_followers.reverse!
            return sorted_followers[0..10]
        else
            sorted_followers.reverse!
            return sorted_followers
        end
    end

    def self.of_a_certain_age(age)
        all.select{|follower| follower.age >= age}
    end

    def self.all
        @@all
    end

end