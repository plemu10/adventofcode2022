#Part 1 
input = File.readlines("input.txt").each {|line| line.chomp!}		#read the file in and strip out the new line characters

head_x, head_y, tail_x, tail_y = 0, 0, 0, 0
tail_positions = []

input.each do |line|
    motion = line.split(' ')
    direction = motion[0]
    distance = motion[1].to_i

    puts "Current motion is #{line}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Current head position is (#{head_x}, #{head_y})"
    puts "Current tail position is (#{tail_x}, #{tail_y})"
    distance.times do
        case direction
        when "U"
            head_y += 1
            puts "Move head up, head pos now (#{head_x}, #{head_y})"
        when "D"
            head_y -= 1
            puts "Move head down, head pos now (#{head_x}, #{head_y})"
        when "L"
            head_x -= 1
            puts "Move head left, head pos now (#{head_x}, #{head_y})"
        when "R"
            head_x += 1
            puts "Move head right, head pos now (#{head_x}, #{head_y})"
        end

        x_diff = head_x - tail_x
        y_diff = head_y - tail_y
        head_pos = [x_diff, y_diff]
        p head_pos
        case head_pos
        when [-2, 2] , [-1, 2] , [-2, 1]
            puts "Move tail diagonal up-left"
            tail_x -= 1
            tail_y += 1
        when [0, 2]
            puts "Move tail up"
            tail_y += 1
        when [1, 2] , [2, 2] , [2, 1]
            puts "Move tail diagonal up-right"
            tail_x += 1
            tail_y += 1
        when [-2, 0]
            puts "Move tail left"
            tail_x -= 1
        when [2, 0]
            puts "Move tail right"
            tail_x += 1
        when [-2, -1] , [-2, -2] , [-1, -2]
            puts "Move tail diagonal down-left"
            tail_x -= 1
            tail_y -= 1
        when [0, -2]
            puts "Move tail down"
            tail_y -= 1
        when [1, -2] , [2, -2] , [2, -1]
            puts "Move tail diagonal-right"
            tail_x += 1
            tail_y -= 1
        else
            puts "Tail does not need to move this time"
        end
        puts "Tail pos is now (#{tail_x}, #{tail_y})"
        tail_positions << [tail_x, tail_y]
    end
end

p tail_positions.uniq.length