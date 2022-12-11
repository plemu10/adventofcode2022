#Part 1 
input = File.readlines("input.txt").each {|line| line.chomp!}		#read the file in and strip out the new line characters

cycle = 1
line = 0
register = 1
signals = []

until line == input.length do
    current_instruction = input[line].split(' ')
    line += 1
    case current_instruction[0]
    when "addx"
        signals << (cycle)*(register) if cycle == 20 || cycle == 60 || cycle == 100 || cycle == 140 || cycle == 180 || cycle == 220
        cycle += 1
        signals << (cycle)*(register) if cycle == 20 || cycle == 60 || cycle == 100 || cycle == 140 || cycle == 180 || cycle == 220
        cycle += 1
        register += current_instruction[1].to_i
    else
        signals << (cycle)*(register) if cycle == 20 || cycle == 60 || cycle == 100 || cycle == 140 || cycle == 180 || cycle == 220
        cycle += 1
    end
end

part1 = 0
signals.each {|signal| part1 += signal}
puts part1