#Part 1 
input = File.readlines("input.txt").each {|line| line.chomp!}		#read the file in and strip out the new line characters

tail_positions = []
knots = [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]

input.each do |line|
    motion = line.split(' ')
    direction = motion[0]
    distance = motion[1].to_i

    puts "Current motion is #{line}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Current head position is (#{knots[0][0]}, #{knots[0][1]})"

    distance.times do                                   #Do for as many time as distance
        knots.each_with_index do |segment, index|       #Process each segment as if it was it's own head-tail
            break if index == 9                         #Stop processing because the tail is already updated and nothing comes after
            #gets.chomp
            head_x = knots[index][0]                    #head_x is the x coord of the current segment
            head_y = knots[index][1]                    #head_y is the y coord of the current segment
            tail_x = knots[index + 1][0]                #tail_X is the x coord of the next segment
            tail_y = knots[index + 1][1]                #tail_y is the y coord of the next segment

            if index == 0
                case direction
                when "U"
                    head_y += 1
                    puts "Move #{index}'rd knot up, pos now (#{head_x}, #{head_y})"
                when "D"
                    head_y -= 1
                    puts "Move #{index}'rd knot down, pos now (#{head_x}, #{head_y})"
                when "L"
                    head_x -= 1
                    puts "Move #{index}'rd knot left, pos now (#{head_x}, #{head_y})"
                when "R"
                    head_x += 1
                    puts "Move #{index}'rd knot right, pos now (#{head_x}, #{head_y})"
                end
            end
    
            head_pos = [head_x - tail_x, head_y - tail_y] #Take the diff between the head and tail to get a position relative to the tail
            case head_pos
            when [-2, 2] , [-1, 2] , [-2, 1]
                puts "Move #{index + 1}'rd knot diagonal up-left"
                tail_x -= 1
                tail_y += 1
            when [0, 2]
                puts "Move #{index + 1}'rd knot up"
                tail_y += 1
            when [1, 2] , [2, 2] , [2, 1]
                puts "Move #{index + 1}'rd knot diagonal up-right"
                tail_x += 1
                tail_y += 1
            when [-2, 0]
                puts "Move #{index + 1}'rd knot left"
                tail_x -= 1
            when [2, 0]
                puts "Move #{index + 1}'rd knot right"
                tail_x += 1
            when [-2, -1] , [-2, -2] , [-1, -2]
                puts "Move #{index + 1}'rd knot diagonal down-left"
                tail_x -= 1
                tail_y -= 1
            when [0, -2]
                puts "Move #{index + 1}'rd knot down"
                tail_y -= 1
            when [1, -2] , [2, -2] , [2, -1]
                puts "Move #{index + 1}'rd knot diagonal-right"
                tail_x += 1
                tail_y -= 1
            else
                puts "#{index + 1}'rd knot does not need to move this time"
            end
            puts "Tail pos is now (#{tail_x}, #{tail_y})"
            knots[index][0] = head_x         #save the updated head_x coord to the segment
            knots[index][1] = head_y         #save the updated head_y coord to the segment
            knots[index + 1][0] = tail_x     #update tail_x which will be the head of the next segment
            knots[index + 1][1] = tail_y     #update tail_y which will be the head of the next segment
            tail_positions << [tail_x, tail_y] if index == 8        #If we are on the tail segment add the position to the list
        end
    end
end

p tail_positions.uniq.length