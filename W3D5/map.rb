

class Map

    def initialize
        @map = []
    end

    def set(key,value)
        # if there's already a matching key, update val
        @map.each do |pair| 
            if pair[0] == key
                pair[1] = value 
                return     # ?? Do we need boolean return?
            end
        end
        @map << [key,value]
    end

    def get(key)
        @map.each { |pair| return pair[1] if pair[0] == key }
    end

    def delete(key)
        @map.each.with_index { |pair, i| @map.delete(pair) if pair[0] == key }
    end

    def show
        @map
    end

end

test_map = Map.new

p test_map.set("a",1)
p test_map.set("b",2)
p test_map.set("c",3)
p test_map.set("a",4)
p test_map.show

p test_map.get("a")
p test_map.get("b")
p test_map.show


p test_map.delete("c")
p test_map.show



