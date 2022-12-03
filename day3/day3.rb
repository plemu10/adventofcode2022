#Part 1 
input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters

combined_priorities = 0     #Count the priorities with this counter

priorities = ('a'..'z').to_a           #Creates a list of lowercase a through z
priorities2 = ('A'..'Z').to_a          #Creates a list of uppercase A through Z
priorities.concat(priorities2)         #Adds the uppercase list to the lowercase list

input.each do |row|
    items = row.split('')                                   #Split the row into a list of characters
    compartments = items.each_slice(row.length/2).to_a      #Split the list of characters into additional list, half the size of the items list
    common = compartments[0] & compartments[1]              #Using the & operator on two lists returns on the common elements
    combined_priorities += priorities.index(common[0]) + 1  #Find the index of the common item and add 1 because lists start at 0 to the combined priorities list
end

puts combined_priorities

#Part 2

combined_priorities = 0                     #Reset the counter to zero
elves = input.clone                         #Clone the input to a new list because we need to remove items from it

(input.length / 3).times do                 #We will do this for the number of groups we know are, which is the number of rows divided by 3
    groups = [elves[0], elves[1], elves[2]] #Set the list groups equal to the first 3 elves in the list of elves
    items0 = groups[0].split('')            #Split the line into characters for easy comparison
    items1 = groups[1].split('')
    items2 = groups[2].split('')
    common = items0 & items1 & items2       #Get the common item from the three elves
    combined_priorities += priorities.index(common[0]) + 1  #Find the index of the common item and add 1 because lists start at 0 to the combined priorities list
    elves.delete_at(2)                      #Delete from the list of elves starting and the third one up so we can do it again on the next pass
    elves.delete_at(1)
    elves.delete_at(0)
end

puts combined_priorities

