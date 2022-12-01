#Part 1 
input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters
count = 0   

#Part 1

elves = []  #Empty array to contain the list of calories each elf has
elf = 0     #Counter for each elf's calories

input.each do |row|
    #puts "Checking #{row}"
    if row.to_i > 0
        #puts "Found food, adding #{row} to #{elf}"
        elf += row.to_i
        #puts "Elf is now #{elf}"
    else
        #puts "Found new elf"
        elves << elf
        elf = 0
    end
end

#puts elves

puts "#{elves.max} most caloric elf"

#Part 2

elves.sort!     #Sorts array in place, meaning that elves is now changed
puts "#{elves[-1] + elves[-2] + elves[-3]} total calories in top 3 elves"       # -1 indicies count backwards from the end of an array

#Time to complete, 12 minutes