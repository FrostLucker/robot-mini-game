#= It is base class for game object
#
# From it can be created Robot, Car or any other object 
# that can be placed on board

class Toy
	attr_accessor :x, :y, :f

	def initialize(x, y, f)
		@x = x.to_i
		@y = y.to_i
		@f = f.downcase.capitalize
	end
end