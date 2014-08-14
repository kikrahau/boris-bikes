module Dog 
	def legs
		"I have 4 legs"
	end
end

class Mammal

	prepend Dog

	def legs 
	  "A mamal has legs"
	end

end

m = Mammal.new
puts m.legs


