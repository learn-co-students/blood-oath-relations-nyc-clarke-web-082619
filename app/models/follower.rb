class Follower
    attr_accessor :name, :age, :life_motto
    @@all = []
    def initialize(name,age,life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
        BloodOath.all.select{|x| x.follower == self}.map{|y| y.cult}
    end

    def num_cults
        cults.length
    end

    def my_cults_slogans
        cults.each{|x| puts x.slogan}
    end

    def join_cult(cult)
        BloodOath.new(Time.now.strftime("%F"), self, cult)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(a)
        @@all.select{|x| x.age >= a}
    end

    def self.most_active
        @@all.max_by{|x| x.num_cults}
    end

    def self.top_ten
        hash = {}
        @@all.each{|x| hash[x] = x.num_cults}.sort_by{|k,v| v}.reverse.first(10).map{|y| y[0]}
    end
end