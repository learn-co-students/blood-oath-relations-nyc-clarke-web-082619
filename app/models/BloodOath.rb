class BloodOath
    attr_reader :cult, :follower, :initiation_date

    @@all = []
    def initialize(cult, follower)
        @cult = cult
        @follower = follower
        @initiation_date = Time.now.strftime("_%Y-%m-%d_")
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        @@all.first 
    end
end