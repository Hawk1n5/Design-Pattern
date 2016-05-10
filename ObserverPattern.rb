#!/usr/bin/env ruby

class Subject
	def initialize()
		@observers = []
	end

	def registerObserver(observer)
		@observers << observer
	end

	def removeObserver(observer)
		@observers.delete(observer)
	end

	def notifyObserver
		raise "Error!"
	end
end

class Observer
	def update(temp, humidity, pressure)
		raise "Error!"
	end

	def display()
		raise "Error!"
	end
end

class WeatherData < Subject
	attr_reader :temp, :humidity, :pressure
	def initialize()
		super()
	end

	def setMeasurments(temp, humidity, pressure)
		@temp = temp
		@humidity = humidity
		@pressure = pressure
		notifyObserver()
	end

	def temp=(temp)
		@temp = temp
		notifyObserver()
	end

	def humidity=(humidity)
		@humidity = humidity
		notifyObserver()
	end

	def notifyObserver
		@observers.each do |observer|
			observer.update(self)
		end
	end
end

class Display < Observer
	attr_reader :title, :content
	def initialize(subject)
		@subject = subject
		@subject.registerObserver(self)
	end

	def update(set)
		puts "Subject is update."
	end

	def display()
		puts "Subject is display."
	end
end
class CurrentConditionDisplay < Observer
	attr_reader :weaterData, :temp, :humidity, :pressure
	def initialize(subject)
		@weaterData = subject
		@weaterData.registerObserver(self)
	end

	def update(set)#temp, humidity, pressure)
		@temp = set.temp
		@humidity = set.humidity
		display()
	end

	def display
		puts "Current conditions : #{@temp} C and #{@humidity}% humidity"
	end
end

def weaterstation
	weaterData = WeatherData.new()
	currentDisplay = CurrentConditionDisplay.new(weaterData)
	display = Display.new(weaterData)

	weaterData.setMeasurments(10.5, 50, 10)
	weaterData.setMeasurments(22, 5, 100)
	weaterData.temp = 100
end

weaterstation()
