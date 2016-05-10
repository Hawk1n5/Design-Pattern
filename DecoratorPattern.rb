#!/usr/bin/ruby
class Beverage
	def initialize(name)
		@name = name
	end
	def cost()
		raise "Error"
	end
	def name()
		return @name
	end
end

class Mocha < Beverage
	def initialize()
		super("Mocha")
	end
	def cost()
		return 1.99
	end
end
class Milk < Beverage
	def initialize()
		super("Milk")
	end
	def cost()
		return 0.89
	end
end

class Composite < Beverage
	def initialize(name,cost)
		super(name)
		@cost = cost
		@sub_Beverage = []
	end

	def <<(beverage)
		@sub_Beverage << beverage
	end
	def remove_burden(beverage_name)
		@sub_Beverage.each {|beverage| @sub_Beverage.delete(beverage) if beverage.name == beverage_name }
	end
	def get_cost()
		cost_tmp = @cost
		@sub_Beverage.each {|beverage| cost_tmp += beverage.cost()}
		return cost_tmp 
	end
end
class DardRoast < Composite
	def initialize()
		super("DardRoast", 1)
	end
end
cofe = DardRoast.new()
cofe << Milk.new
cofe << Mocha.new
cofe << Mocha.new

puts cofe.get_cost()
cofe.remove_burden("Mocha")
puts cofe.get_cost()
