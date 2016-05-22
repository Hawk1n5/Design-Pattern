#!/usr/bin/ruby
class Pizza

	def initialize(name)
		@name = name
	end

	def prepare()
		puts "準備#{@name}比薩中..."
	end

	def bake()
		puts "正在烘培，請稍等..."
	end
	
	def cut()
		puts "把做好的比薩切片。"
	end

	def box()
		puts "裝合售出。"
	end
end
class NYstyleCheesePizza < Pizza
	def initialize()
		super('NY cheese')
	end
end
class NYstyleClamPizza < Pizza
	def initialize()
		super('NY clam')
	end
end

class TWstyleCheesePizza < Pizza
	def initialize()
		super('TW cheese')
	end
end
class TWstyleClamPizza < Pizza
	def initialize()
		super('TW clam')
	end
end

class PizzaStore
	def initialize()
		
	end

	def orderPizza(type)
		pizza = createPizza(type)
		pizza.prepare()
		pizza.bake()
		pizza.cut()
		pizza.box()
	end
end
#Factory Method
class NYPizzaStore < PizzaStore
	def createPizza(type)
		if type == "cheese"
			pizza = NYstyleCheesePizza.new()
		else type == "clam"
			pizza = NYstyleClamPizza.new()
		end
		return pizza
	end
end
class TWPizzaStore < PizzaStore
	def createPizza(type)
		if type == "cheese"
			pizza = TWstyleCheesePizza.new()
		else type == "clam"
			pizza = TWstyleClamPizza.new()
		end
		return pizza
	end
end


nyPizzaStore = NYPizzaStore.new()
twPizzaStore = TWPizzaStore.new()

nyPizzaStore.orderPizza('clam')
twPizzaStore.orderPizza('cheese')