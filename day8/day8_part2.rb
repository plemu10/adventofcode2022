#Part 1 
input = File.readlines("input.txt").each {|line| line.chomp!}		#read the file in and strip out the new line characters

rows = []                                                       #Empty list to hold all the rows
scenic_scores = []                                              #Empty list to hold the scenic score of all the trees
input.each  {|line| rows << line.split('')}                     #Add each line split up by character to the rows list
trees_visible = (rows[0].length)*2 + (rows.length - 2)*2        #number of perimeter trees

rows.each_with_index do |row, row_index|
    next if row_index == 0 || row_index == (rows.length - 1)
    row.each_with_index do |tree, tree_index|
        next if tree_index == 0 || tree_index == (row.length - 1)
        scenic_up = 0
        scenic_down = 0
        scenic_left = 0
        scenic_right = 0

        #Checking the top line
        #puts "Checking #{tree} up"
        count = rows.length - (rows.length - row_index)
        (rows.length - (rows.length - row_index) ).times do
            #puts "Comparing #{input[count - 1][tree_index]} against #{tree}"
            if input[count - 1][tree_index] < tree
                scenic_up += 1
                #puts "Tree has +1 scenic score"
            else
                #puts "Tree is done with it's view up, #{scenic_up} scenic"
                scenic_up += 1
                break
            end 
            count -= 1
        end
        #puts "[#{row_index}][#{tree_index}](#{tree}) has a view distance of #{scenic_up} up"

        #Checking the bottom line
        #puts "Checking [#{row_index}][#{tree_index}](#{tree}) down"
        count = 1
        (rows.length - row_index - 1).times do
            #puts "Comparing #{input[row_index + count][tree_index]} against #{tree}"
            if input[row_index + count][tree_index] < tree
                scenic_down += 1
                #puts "Tree has +1 scenic score"
            else
                #puts "Tree is done with it's view down, #{scenic_down} scenic"
                scenic_down += 1
                break
            end 
            count += 1
        end
        #puts "[#{row_index}][#{tree_index}](#{tree}) has a view distance of #{scenic_down} down"

        #Checking the left line
        #puts "Checking #{tree} left"
        count = row.length - (row.length - tree_index)
        (row.length - (row.length - tree_index)).times do
            #puts "Comparing #{input[row_index][count - 1]} against #{tree}"
            if input[row_index][count - 1] < tree
                scenic_left += 1
                #puts "Tree has +1 scenic score"
            else
                #puts "Tree is done with it's view left, #{scenic_left} scenic"
                scenic_left += 1
                break
            end 
            count -= 1
        end
        #puts "[#{row_index}][#{tree_index}](#{tree}) has a view distance of #{scenic_left} left"

        #Checking the bottom line
        #puts "Checking #{tree} right"
        count = 1
        (row.length - tree_index - 1).times do
            #puts "Comparing #{input[row_index][tree_index + count]} against #{tree}"
            if input[row_index][tree_index + count] < tree
                scenic_right += 1
                #puts "Tree has +1 scenic score"
            else
                #puts "Tree is done with it's view left, #{scenic_right} scenic"
                scenic_right += 1
                break
            end 
            count += 1
        end
        #puts "[#{row_index}][#{tree_index}](#{tree}) has a view distance of #{scenic_right} right"

        scenic_scores << scenic_up*scenic_down*scenic_left*scenic_right
    end
end
puts scenic_scores.max