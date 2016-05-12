#!/usr/bin/ruby

class Duck
  attr_accessor :flyBehavior, :quackBehavior
  def initialize(fly, quack)
    @flyBehavior = fly
    @quackBehavior = quack
  end
  def fly
    @flyBehavior.fly
  end
  def quack
    @quackBehavior.quack
  end
end

class FlyWithWins
  def fly
    puts "fly.fly.fly"
  end
end

class FlyNoWay
  def fly
    puts "Can't fly."
  end
end

class Quack
  def quack
    puts "Quack."
  end
end

class NoneQuack
  def quack
    puts "......"
  end
end

class BlueDuck < Duck
  def initialize()
    super(FlyNoWay.new(), Quack.new())
  end
end
class RedDuck < Duck
  def initialize()
    super(FlyWithWins.new(), NoneQuack.new())
  end
end
puts "-----duck1------"
duck1 = RedDuck.new()
duck1.fly()
duck1.quack()
duck1.quackBehavior = Quack.new()
duck1.quack()
puts "-----duck2------"
duck2 = BlueDuck.new()
duck2.fly()
duck2.flyBehavior = FlyWithWins.new()
duck2.fly()
