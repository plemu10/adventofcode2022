#Part 1 
input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters

overlaps = 0                                    #Counter to track the number of overlaps

input.each do |row|
    assignments = row.split(',')                #Split each row on the comma
    elf0 = assignments[0].split('-')            #Split the first half of the row on the dash to get a list of 2 numbers
    elf1 = assignments[1].split('-')            #Split the first half of the row on the dash to get a list of 2 numbers
    range0 = ("#{elf0[0]}".."#{elf0[1]}").to_a  #Create a list of all the numbers between and inclusive of the first and last number in elf0
    range1 = ("#{elf1[0]}".."#{elf1[1]}").to_a  #Create a list of all the numbers between and inclusive of the first and last number in elf1

    overlaps += 1  if (range0 - range1).empty? || (range1 - range0).empty?  #Increment the overlaps counter by 1 if removing either range from the other results in an empty list
end

puts overlaps


#Part 2

overlaps = 0

input.each do |row|
    assignments = row.split(',')                #Same as before
    elf0 = assignments[0].split('-')            #Same as before       
    elf1 = assignments[1].split('-')            #Same as before
    range0 = ("#{elf0[0]}".."#{elf0[1]}").to_a  #Same as before
    range1 = ("#{elf1[0]}".."#{elf1[1]}").to_a  #Same as before

    if (range0 & range1).any?                   #Look for all common elements between both ranges
        overlaps += 1                           #If any exist, increment the overlaps counter by 1
    end
end

puts overlaps