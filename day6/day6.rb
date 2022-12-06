#Part 1 
input = File.readlines("input.txt").each {|line| line.chomp!}		#read the file in and strip out the new line characters

counter = 0

data = input[0].split('')
buffer = [data[0], data[1], data[2], data[3]]

data.each_with_index do |char, index|
    #puts "Buffer is currently #{buffer}, checking #{char}"
    buffer.shift
    buffer << char
    if buffer.uniq.length == 4
        puts "Buffer found at index #{index + 1}"
        break
    end
end

#Part 2

message = [data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13]]
data.each_with_index do |char, index|
    #puts "Buffer is currently #{buffer}, checking #{char}"
    message.shift
    message << char
    if message.uniq.length == 14
        puts "Buffer found at index #{index + 1}"
        break
    end
end
