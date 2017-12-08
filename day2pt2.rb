def importer (fileLoc)
	spreadsheet=[]
	file=File.open(fileLoc,"r")
	file.each_line{|line|
		spreadsheet<<line.split("\n")[0].split(",")
		spreadsheet[-1].map!{|i|
			i.to_i
		}
	}
	return spreadsheet
end
def summer (array)
	dend=nil
	isor=nil
	array.each{|dividend|
		array.each{|divisor|
		puts dividend%divisor
		if(dividend==divisor)
			next
		elsif(dividend%divisor==0)
			dend=dividend
			isor=divisor
			break
		end
		}
		if(!dend.nil?)
			break
		end
	}
	if(dend.nil?)
		return 1
	else
		return dend/isor
	end
end
#print "Input data Location > "
fileloc="./day2.input"
spreadsheet=importer(fileloc)
checksum=0
spreadsheet.each{|row|
	checksum+=summer(row)
}
puts "Checksum: #{checksum}"
