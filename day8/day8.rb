#Part 1 
input = File.readlines("input.txt").each {|line| line.chomp!}		#read the file in and strip out the new line characters

rows = []                                                       #Empty list to hold all the rows
input.each  {|line| rows << line.split('')}                     #Add each line split up by character to the rows list
trees_visible = (rows[0].length)*2 + (rows.length - 2)*2        #number of perimeter trees

rows.each_with_index do |row, row_index|
    next if row_index == 0 || row_index == (rows.length - 1)
    row.each_with_index do |tree, tree_index|
        next if tree_index == 0 || tree_index == (row.length - 1)

        #Checking the top line
        #puts "Checking #{tree} up"
        visible = true
        count = rows.length - (rows.length - row_index)
        (rows.length - (rows.length - row_index) ).times do
            #puts "Comparing #{input[count - 1][tree_index]} against #{tree}"
            if input[count - 1][tree_index] >= tree
                visible = false
                #puts "Tree IS NOT visible from top"
                break
            end 
            count -= 1
        end
        if visible == true
            trees_visible += 1 
            #puts "+1 trees visible"
            next
        end

        #Checking the bottom line
        #puts "Checking [#{row_index}][#{tree_index}](#{tree}) down"
        visible = true
        count = 1
        (rows.length - row_index - 1).times do
            #puts "Comparing #{input[row_index + count][tree_index]} against #{tree}"
            if input[row_index + count][tree_index] >= tree
                visible = false
                #puts "Tree IS NOT visible from bottom"
                break
            end 
            count += 1
        end
        if visible == true
            trees_visible += 1 
            #puts "+1 trees visible"
            next
        end

        #Checking the left line
        #puts "Checking #{tree} left"
        visible = true
        count = row.length - (row.length - tree_index)
        (row.length - (row.length - tree_index)).times do
            #puts "Comparing #{input[row_index][count - 1]} against #{tree}"
            if input[row_index][count - 1] >= tree
                visible = false
                #puts "Tree IS NOT visible from left"
                break
            end 
            count -= 1
        end
        if visible == true
            trees_visible += 1 
            #puts "+1 trees visible"
            next
        end

        #Checking the bottom line
        #puts "Checking #{tree} right"
        visible = true
        count = 1
        (row.length - tree_index - 1).times do
            #puts "Comparing #{input[row_index][tree_index + count]} against #{tree}"
            if input[row_index][tree_index + count] >= tree
                visible = false
                #puts "Tree IS NOT visible from right"
                break
            end 
            count += 1
        end
        if visible == true
            trees_visible += 1 
            #puts "+1 trees visible"
            next
        end

    end
end

puts trees_visible