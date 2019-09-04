require 'date'
class BloodOath

    attr_reader :follower, :cult, :initiation_date

    @@all = []

    def initialize(follower, cult)
        @follower = follower
        @cult = cult
        @initiation_date = Date.today.to_s 
        @@all << self
    end 

    def self.all
        @@all
    end
        
end 