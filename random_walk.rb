#!/usr/bin/env ruby
# moving 1 square
# n=# of steps

# each step 1 square - random direction
# return avg distnace from home at the end of all walks

class Location
  def initialize(x, y)
    @x = x
    @y = y
  end

  def move(deltaX, deltaY)
    # if not already deltaX and deltaY are integers
    Location.new(@x + deltaX,  @y + deltaY)
  end

  def getX
    @x
  end

  def getY
    @y
  end

  def distFrom(other)
    xDist = @x - other.getX
    yDist = @y - other.getY
    (xDist**2 + yDist**2)**0.5
  end

  def string
    "< #{@x.to_s} , #{@y.to_s} >"
  end
end

class Field
  def initialize
    @walkers = {}
  end

  def showWalkers
    @walkers
  end

  def addWalker(walker, loc)
    raise "Duplicate walker" if @walkers.include?(walker)
    @walkers[walker] = loc
  end

  def moveWalker(walker)
    raise 'Walker not in field' unless @walkers.include?(walker)
    xDist, yDist = walker.takeStep
    @walkers[walker] = @walkers[walker].move(xDist, yDist)
  end

  def getLoc(walker)
    raise "Walker not in field" unless @walkers.include?(walker)
    @walkers[walker]
  end
end

class Walker
  def initialize(name=nil)
    @name = name
  end

  def name
    @name
  end

  def string
    if Walker.nil?
      @name
    end
    'Anonymous'
  end

  def takeStep
    stepChoices = [[0,1], [0,-1], [1,0], [-1,0]]
    stepChoices.sample
  end
end

def walk(f, w, numSteps)
  # f is a Field, w is a Walker in f, and  numSteps is an integer >=0
  # Moves w numSteps times and returns the distance between
  # the final location and the location at the start of the walk
    start = f.getLoc(w)
    for s in 1..numSteps
      f.moveWalker(w)
    end
    start.distFrom(f.getLoc(w))
  end

def simulateWalks(numSteps=5, numTrials=10, wClass=Walker)
  walker1 = wClass.new('Walker1')
  origin = Location.new(0, 0)
  distances = []
  for t in 1..numTrials
    f = Field.new
    f.addWalker(walker1, origin)
    distances << walk(f, walker1, numSteps).round
  end
  distances
end

def avgRandomWalk(numSteps, numTrials, wClass=Walker)
  # walkLengths param should be an array
  distances = simulateWalks(numSteps, numTrials, wClass)
  puts "#{wClass.name}, random walk of #{numSteps} steps"
  puts " Mean = #{distances.reduce(0, :+)/distances.length}"
  puts " Max = #{distances.max}, Min = #{distances.min}"
end

avgRandomWalk(100,100)



# avg_random_walk([5], 10, Walker)
