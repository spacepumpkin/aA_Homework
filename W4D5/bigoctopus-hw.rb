# Octopus wants to eat the longest fish
# Algorithm Time Complexity

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus O(n2)
def sluggish(fish)
    fish.each.with_index do |f1, i1|
        longest = true
        fish.each.with_index do |f2, i2|
            next if i1 == i2
            longest = false if f2.length > f1.length
        end
        return f1 if longest
    end
end

# Dominant Octopus O(nlogn)
def merge_sort(fish)
    return fish if fish.length <= 1

    mid = fish.length/2
    left = fish[0...mid]
    right = fish[mid..-1]
    merge( merge_sort(left), merge_sort(right ) )
end

def merge(left,right)
    merged = []
    until left.empty? || right.empty?
        case left[0].length <=> right[0].length
        when 1
            merged << right.shift
        else
            merged << left.shift
        end 
    end
    merged + left + right
end

def dominant(fish)
    return merge_sort(fish)[-1]
end


# Clever Octopus O(n)
def clever(fish)
    biggestfish = ""
    fish.each { |f| biggestfish = f if f.length > biggestfish.length }
    biggestfish
end

########################################################################

# Dancing Octopus (direction corresponds to tentacle #)
# Data Structure Time Complexity

# Slow dance O(n) -- array
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, moves)
    moves.each.with_index { |move, tentacle| return tentacle if move == dir }
end

# p slow_dance("up", tiles_array) #=> 0
# p slow_dance("right-down", tiles_array) #=> 3


# Constant dance! O(1) -- hash
new_tiles_array = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

def constant_dance(dir, moves)
    return moves[dir]
end

# p constant_dance("up", new_tiles_array) #=> 0
# p constant_dance("right-down", new_tiles_array) #=> 3