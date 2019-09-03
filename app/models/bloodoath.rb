class BloodOath
    attr_accessor :date,:follower,:cult
    @@all = []
    def initialize(date,follower,cult)
        @date = date
        @follower = follower
        @cult = cult
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        return @@all.sort_by{|x| x.date}
    end
end