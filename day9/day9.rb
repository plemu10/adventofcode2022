#Part 1 
input = File.readlines("input.txt").each {|line| line.chomp!}		#read the file in and strip out the new line characters

head_x, head_y, tail_x, tail_y = 0, 0, 0, 0 #Initialize the head and tail to 0,0
tail_positions = []                         #Empty list to keep track of the positions the tail visits

input.each do |line|
    motion = line.split(' ')                #Split the line on the whitespace
    direction = motion[0]                   #The direction is the first element of the line
    distance = motion[1].to_i               #The distance is the second element of the line converted to integer
    distance.times do                       #Do this the number of times to move 
        case direction
        when "U"
            head_y += 1
        when "D"
            head_y -= 1
        when "L"
            head_x -= 1
        when "R"
            head_x += 1
        end

        head_pos = [head_x - tail_x, head_y - tail_y] #Take the difference between the head and tail to get a relative position to the tail
        case head_pos
        when [-2, 2] , [-1, 2] , [-2, 1]    #Move tail diagonal up-left
            tail_x -= 1
            tail_y += 1
        when [0, 2]                         #Move tail up
            tail_y += 1
        when [1, 2] , [2, 2] , [2, 1]       #Move tail diagonal up-right
            tail_x += 1
            tail_y += 1
        when [-2, 0]                        #Move tail left
            tail_x -= 1
        when [2, 0]                         #Move tail right   
            tail_x += 1
        when [-2, -1] , [-2, -2] , [-1, -2] #Move tail diagonal down-left
            tail_x -= 1
            tail_y -= 1
        when [0, -2]                        #Move tail down
            tail_y -= 1
        when [1, -2] , [2, -2] , [2, -1]    #Move tail diagonal-right
            tail_x += 1
            tail_y -= 1
        end
        tail_positions << [tail_x, tail_y]  #Add the current tail position to the list of tail positions
    end
end

p tail_positions.uniq.length            #Get the unique length of positions within the tail positions list