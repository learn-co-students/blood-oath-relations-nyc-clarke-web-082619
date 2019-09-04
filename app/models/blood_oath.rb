class BloodOath
    attr_reader :follower, :cult, :date

    @@all = []

    def initialize(follower, cult, date)
        @follower = follower
        @cult = cult
        @date = date

        @@all << self
    end

    def self.first_oath
        sorted_oaths = all.sort_by{|oath| oath.date}
        sorted_oaths[0].follower
    end

    def self.all
        @@all
    end
end