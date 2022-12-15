monkey0 = [77, 69, 76, 77, 50, 58]
monkey1 = [75, 70, 82, 83, 96, 64, 62]
monkey2 = [53]
monkey3 = [85, 64, 93, 64, 99]
monkey4 = [61, 92, 71]
monkey5 = [79, 73, 50, 90]
monkey6 = [50, 89]
monkey7 = [83, 56, 64, 58, 93, 91, 56, 65]

inspection_counter = [0, 0, 0, 0, 0, 0, 0, 0]
round = 1
10000.times do
    puts "On Round #{round}"
    monkey0.each do |worry|
        new_worry = worry * 11
        inspection_counter[0] += 1
        new_worry = new_worry % 9699690
        if new_worry % 5 > 0
            monkey5 << new_worry
        else
            monkey1 << new_worry
        end
    end
    monkey0 = []

    monkey1.each do |worry|
        new_worry = worry + 8
        inspection_counter[1] += 1
        new_worry = new_worry % 9699690
        if new_worry % 17 > 0
            monkey6 << new_worry
        else
            monkey5 << new_worry
        end
    end
    monkey1 = []

    monkey2.each do |worry|
        new_worry = worry * 3
        inspection_counter[2] += 1
        new_worry = new_worry % 9699690
        if new_worry % 2 > 0
            monkey7 << new_worry
        else
            monkey0 << new_worry
        end
    end
    monkey2 = []

    monkey3.each do |worry|
        new_worry = worry + 4
        inspection_counter[3] += 1
        new_worry = new_worry % 9699690
        if new_worry % 7 > 0
            monkey2 << new_worry
        else
            monkey7 << new_worry
        end
    end
    monkey3 = []

    monkey4.each do |worry|
        new_worry = worry * worry
        inspection_counter[4] += 1
        new_worry = new_worry % 9699690
        if new_worry % 3 > 0
            monkey3 << new_worry
        else
            monkey2 << new_worry
        end
    end
    monkey4 = []

    monkey5.each do |worry|
        new_worry = worry + 2
        inspection_counter[5] += 1
        new_worry = new_worry % 9699690
        if new_worry % 11 > 0
            monkey6 << new_worry
        else
            monkey4 << new_worry
        end
    end
    monkey5 = []

    monkey6.each do |worry|
        new_worry = worry + 3
        inspection_counter[6] += 1
        new_worry = new_worry % 9699690
        if new_worry % 13 > 0
            monkey3 << new_worry
        else
            monkey4 << new_worry
        end
    end
    monkey6 = []

    monkey7.each do |worry|
        new_worry = worry + 5
        inspection_counter[7] += 1
        new_worry = new_worry % 9699690
        if new_worry % 19 > 0
            monkey0 << new_worry
        else
            monkey1 << new_worry
        end
    end
    monkey7 = []

    round += 1
    #gets.chomp
end

p inspection_counter

max1 = inspection_counter.max
puts max1
inspection_counter.delete(max1)
max2 = inspection_counter.max
puts max2
puts max1 * max2