require 'pry'
class Gym
#returns an array of all gyms
@@all = []

#initalizes with a name
attr_accessor :name

#initalizes with a name
  def initialize(name)
    @name = name

    #returns an array of all gyms
    @@all << self
  end

#all returns an array of all gyms
  def self.all
    @@all
  end

#memberships returns an array of all of that gym's memberships
  def memberships
    Membership.all.select do |membership|

      membership.gym == self
  end #membership.all.select
end #memberships

 #lifters returns an array of all of that gym's lifters
  def lifters
    memberships.map do |membership|
      membership.lifter

  end #membership.map

end #lifters

# lifter_names returns an array of all the names of that gym's lifters
  def lifter_names
    lifters.map do |lifter|
      lifter.name
      #array of lifters name
      #in order to get to the name of each lifter you have to iterate through the lifter to get the name of the lifter
  end
end

#lift_total_for_gym returns a sum of lift_totals for all the lifters at that gym
  def lift_total_for_gym
    total = 0
    lifters.each do |lifter|
    total +=  lifter.lift_total

    end
    total
  end

end
