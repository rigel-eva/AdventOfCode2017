def summer(sequence)
	currentSearch=nil
	returner=0
	halfLength=sequence.length/2
	(0..halfLength).each{|i|
		if(sequence[i]==sequence[i+halfLength])
			returner+=sequence[i].to_i
		end
	}
	return returner*2
end
print "Current sequence > "
sequence=gets
puts summer(sequence)
