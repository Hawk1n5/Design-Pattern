#!/usr/bin/ruby

class Logger
	attr_accessor :level
	
	ERROR = 1
	WARNING = 2
	INFO = 3

	def initialize()
		@log = File.open("log.txt","w")
		@level = WARNING
	end

	@@instance = Logger.new
	
	def self.instance
		return @@instance
	end
	
	def info(msg)
		@log.puts("[INFO] #{msg}") if @level >= INFO
		@log.flush
	end 
	
	def error(msg)
		@log.puts("[ERROR] #{msg}")
		@log.flush
	end
	
	def warning(msg)
		@log.puts("[WARNING] #{msg}")
		@log.flush
	end

	private_class_method :new
end

log = Logger.instance
log.level = Logger::INFO
log.info("Test")
log.error("test")
