#Part 1 
input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters

score = 0

#A and X = Rock    1 point
#B and Y = Paper   2 points
#C and Z = Scissor 3 points
#Win is 6 points, Draw is 3 points, Loss is 0 points

input.each do |row|
    #puts "Testing #{row}"
    case row                            #Case is like a very powerful if statement that gives you lots of conditions to plan for
    when "A X"
        score += 1 + 3
    when "A Y"
        score += 2 + 6
    when "A Z"
        score += 3 + 0
    when "B X"
        score += 1 + 0
    when "B Y"
        score += 2 + 3
    when "B Z"
        score += 3 + 6
    when "C X"
        score += 1 + 6
    when "C Y"
        score += 2 + 0
    when "C Z"
        score += 3 + 3
    end
end

puts "Part 1 Score is #{score}"

#Part 2

score = 0

#Now X means lose, Y means Draw, Z means win

input.each do |row|
    #puts "Testing #{row}"
    case row
    when "A X"
        score += 3 + 0
    when "A Y"
        score += 1 + 3
    when "A Z"
        score += 2 + 6
    when "B X"
        score += 1 + 0
    when "B Y"
        score += 2 + 3
    when "B Z"
        score += 3 + 6
    when "C X"
        score += 2 + 0
    when "C Y"
        score += 3 + 3
    when "C Z"
        score += 1 + 6
    end
end

puts "Part 2 Score is #{score}"