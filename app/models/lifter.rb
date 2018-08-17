class Lifter
  attr_accessor :name, :lift_total
#returns an array of all Lifters
  @@all = []

#initializes with a name and lift_total
  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    #returns an array of all Lifters
    @@all << self
  end

 #.all returns an array of all Lifters
  def self.all
    @@all
  end

  #memberships returns an array of all memberships of that lifter
  def memberships
      Membership.all.select do |membership|

        membership.lifter == self
    end
  end

#gyms returns an array of all gyms that lifter has memberships to
 def gyms
   memberships.map do |membership|
     membership.gym
 end
end

 #average_lift returns the average lift_total of all lifters
  def self.average_lift
    total = 0
    average = 0

  self.all.each do |lifter|
  total += lifter.lift_total
end
average = total / self.all.length

  end

  #sign_up creates a new Membership and associates a lifter and gym (FAILED - 1)
  def sign_up(gym, cost)
    Membership.new(self, gym, cost)

  end

  #total_cost returns a sum of the total cost of lifter's gym memberships
  def total_cost
    total = 0
    memberships.each do |membership|
      total += membership.cost
  end
  total
end
end
