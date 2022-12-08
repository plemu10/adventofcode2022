#Part 1 
input = File.readlines("test.txt").each {|line| line.chomp!}		#read the file in and strip out the new line characters

class Directory
    #Reader and Accessor attributes
    attr_reader :name, :contents
    attr_accessor :size

    def initialize (directory_name, directory_size, directory_contents)
        @name = directory_name
        @size = directory_size
        @contents = directory_contents
    end
    /~#This makes the class enumerable based on the size.  Remember this shit right here.
    def <=> (other)
            self.size <=> other.size
    end~/
end

directories = []            #Empty array to hold all the directory objects
current_directory = []      #Empty array that we will build a directory path to to keep track of current directory

input.each_with_index do |line, index|
    item = line.split(' ')
    puts "#{line}"
    case item[1]
    when "cd"
        if item[2] == ".."
            puts "Go back one level"
            current_directory.pop
        else
            current_directory << item[2]
            puts "Current directory is #{current_directory}"
        end
    when "ls"
        directory_name = current_directory.clone
        directory_size = 0
        directory_contents = []
        directories << Directory.new(directory_name, directory_size, directory_contents)     
    else
        puts "Add #{line} to #{current_directory}"
        directories.each {|directory| directory.contents << line if directory.name == current_directory}
    end
end

directories.each do |directory| 
    directory.contents.each do |file|
        
    end
end

def directory_size (directories)

    return size
end

