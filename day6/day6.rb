#Part 1 
input = File.readlines("input.txt").each {|line| line.chomp!}		#read the file in and strip out the new line characters

counter = 0

data = input[0].split('')
buffer = data[0, 4]

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

message = data[0, 14]
data.each_with_index do |char, index|
    #puts "Buffer is currently #{buffer}, checking #{char}"
    message.shift
    message << char
    if message.uniq.length == 14
        puts "Message found at index #{index + 1}"
        break
    end
end
