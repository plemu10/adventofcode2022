#Part 1 
input = File.readlines("input.txt").each {|line| line.chomp!}		#read the file in and strip out the new line characters

#Identify the lines the denote boxes vs instructions
instructions = input.clone      #To get just the instructions we will clone the input and remove the boxes and stacks lines to process later
crate_lines = []                #Empty list to contain all the lines with crates
stacks = []                     #Empty list to build the stacks into
input.each do |row|             #For every line from the start of the file
    line = row.split('')        #Split on every character
    instructions.delete(row)    #Delete this non-instruction line from the instructions list
    stacks = line.to_a               #The last line before we break will be the stack numbers       
    break if line[1] == "1"     #Break out of the loop if you find the line that starts with 1
    crate_lines << line         #Add the current row to the list of boxes
end
instructions.delete_at(0)       #Get rid of the extra empty line so we have just the list of instructions

indexes = []                    #Empty list to contain the number of stacks and where within the line they occur
stacks.each_with_index {|crate, index| indexes << index if crate != ' '}    #Gets us a list of the index we need to look in a line to find a crate

crate_lines.reverse!            #Reverse the order of the crate lines so we can build stacks bottom up

crate_lines.each do |row|
    indexes.each_with_index do |position, stack|
        if ('A'..'Z').include?(row[position])       #If there is a crate at the critical index of the line
        stacks[position] << row[position]          #Add that crate to the stack of the corresponding index
        end
    end
end

=begin
instructions.each do |moves|        #Process the instructions
    actions = moves.split(' ')      #actions[1] is quantity, actions[3] is source, actions[5] is destination
    actions[1].to_i.times do
        crane = stacks[indexes[actions[3].to_i - 1]].split('').last
        stacks[indexes[actions[3].to_i - 1]].chop!
        stacks[indexes[actions[5].to_i - 1]] << crane
    end    
end
=end

#stacks.each {|stack| puts stack.split('').last}

#Part 2

p stacks

instructions.each do |moves|        #Process the instructions
    puts "Processing #{moves}"
    actions = moves.split(' ')      #actions[1] is quantity, actions[3] is source, actions[5] is destination
    crane = stacks[indexes[actions[3].to_i - 1]][-actions[1].to_i..-1]
    p stacks[indexes[actions[3].to_i - 1]][-actions[1].to_i..-1]
    actions[1].to_i.times do stacks[indexes[actions[3].to_i - 1]].chop! end
    stacks[indexes[actions[5].to_i - 1]] << crane
    p stacks[indexes[actions[5].to_i - 1]]
end

stacks.each {|stack| puts stack.split('').last}