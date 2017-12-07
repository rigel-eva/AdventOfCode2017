def summer(sequence)
	currentSearch=nil
	found=false
	returner=0
	(0..sequence.length).each{|i|
		if(currentSearch.nil?)
			currentSearch=sequence[i]
			next
		end
		if(sequence[i]==currentSearch)
			returner+=sequence[i].to_i
			found=true
		elsif (found)
			currentSearch=sequence[i]
		end
		
	}
	return returner
end
print "Current sequence > "
sequence=gets
puts summer(sequence)
