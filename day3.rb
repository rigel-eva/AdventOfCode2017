#ok ... trying to visualize the problem atm ...
#
#So, what we have at the moment is a spiral, and we know we are a certian number of steps along said spiral
#
#17	16	15	14	13
#18	5	4	3	12
#19	6	1	2	11
#20	7	8	9	10
#21	22	23	24	etc
#
#and we need to navagate back to the center as quickly as possible 
#soooooo we need to figure out how to turn a certian number of steps into a x,y coordinate, and then it's easy enough to figure out how to backtrack to 0,0
#so, first step ... we should figure out which "ring" of the spiral we are on ...
def findRing(spiralLoc)
	currentRing=1#Our current ring, we are gonna end up returning this ... unfortunatly the maths work out nicer if we start at 1 ...
	currentSum=1 #and our current sum
	while spiralLoc>currentSum
		currentRing+=1		   #incrementing our ring number up
		currentSum+=currentRing*2*4#Incrementing the number of addresses we have to work with up
	end
	return currentRing
end
#ok, so next we really should figure out how many memory addresses are in the rings below us ... it will narrow down our search
def getArea(ringNumber)
	((ringNumber-1)*2+1)**2
end
#alright, so with that sorted ... we can figure out which part of the ring we are in
def findCoordinates(spiralLocation)
	returner=[nil,nil]
	ring=findRing(spiralLocation)#ring that this spiral location is on
	puts ring
	ringLocation=spiralLocation-getArea(ring-1)
	ringSection=ceiling(ringLocation/2.0/ring)
	#ok so, what we've got out of the ring section is ...
	# 1. whether we are on the x (if it's odd) or on the y (if it's even)
	# 2. what we need to subtract (ring section-ring)
	#soooo ... let's find out which one is which first
	if(ringSection%2)
		returner[0]=ring*-1*(2-ringSection)
		returner[1]=ringLocation-ringSection*ring
	else
		returner[1]=ring*-1*(3-ringSection)
		returner[0]=ringLocation-ringSection*ring
	end
	return returner
end
