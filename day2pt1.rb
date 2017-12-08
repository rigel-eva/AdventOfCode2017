def importer (fileLoc)
	spreadsheet=[]
	file=File.open(fileLoc,"r")
	file.each_line{|line|
		spreadsheet<<line.split("\n")[0].split(",")
		spreadsheet[-1].map!{|i|
			i.to_i
		}
	}
	puts spreadsheet
	return spreadsheet
end
def summer (array)
	lowest=array[0]
	highest=array[0]
	array.each{|element|
		if(element<lowest)
			lowest=element
		elsif(element>highest)
			highest=element
		end
	}
	return highest-lowest
end
#print "Input data Location > "
fileloc="./day2.input"
spreadsheet=importer(fileloc)
checksum=0
spreadsheet.each{|row|
	puts summer(row)
	checksum+=summer(row)
}
puts "Checksum: #{checksum}"
