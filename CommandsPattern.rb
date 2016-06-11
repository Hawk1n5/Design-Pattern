#!/usr/bin/ruby

class Command
	def initialize(description)
		@description = description
	end

	def execute()
		raise NotImplementedError
	end
	def unexecute()
		raise NotImplementedError
	end
end

class RemoteController < Command
	def initialize(name)
		super("#{name}'s remote controller.")
		@commands = []
	end
	
	def execute(index)
		@commands[index].execute() if @commands[index] != nil
	end
	def unexecute(index)
		@commands[index].unexecute() if @commands[index] != nil
	end
	def <<(command)
		@commands << command
	end
end

class Light < Command
	ON = true
	OFF = false
	def initialize(name)
		super("#{name}'s light.")
		@statu = OFF
	end
	def execute()
		if @statu
			puts "Light is Off."
			@statu = OFF
		else
			puts "Light is ON."
			@statu = ON					
		end
	end
	def unexecute()
		if @statu
                        puts "Light is Off."
                        @statu = OFF
                else    
                        puts "Light is ON."
                        @statu = ON                                     
                end
	end
end

class Fan < Command
	CLOSE = 0
	SMALL = 1
	MEDIUM = 2
	HIGHER = 3
	def initialize(name)
		super("#{name}'s fan.")
		@statu = CLOSE
	end
	
	def execute()
		@statu += 1
		@statu = CLOSE if @statu > HIGHER
		puts "Fan is level #{@statu} now."
	end
	
	def unexecute()
		@statu -= 1
		@statu = HIGHER if @statu < CLOSE
		puts "Fan is level #{@statu} now."
	end
end
remote = RemoteController.new("Living Room")
light1 = Light.new("Living Room")
remote << light1
remote.execute(0)
remote.execute(0)
remote.unexecute(0)

fan = Fan.new("Living Room")
remote << fan
remote.execute(1)
remote.execute(1)
remote.execute(1)
remote.unexecute(1)
remote.unexecute(1)
