# require_relative "simple_queue"

class LRUCache #< Queue
    def initialize(capacity)
        @capacity = capacity
        @underlying_arr = []
        # super()
    end

    def count
      # returns number of elements currently in cache
      underlying_arr.size
    end

    def add(el)
      # adds element to cache according to LRU principle
        if cache_contains?(el)
        # if el is already in queue, delete it and add it to front
            delete(el)
            enqueue(el)
        elsif (self.count < @capacity) # if not, and we're not at capacity, add to front
            enqueue(el)
        else
            dequeue
            enqueue(el)
        end
        underlying_arr
    end

    def show
      # shows the items in the cache, with the LRU item first
      p underlying_arr
    end

    private
    # helper methods go here!
    attr_accessor :underlying_arr

    def cache_contains?(item)
        underlying_arr.include?(item)
    end

    def index(item)
        underlying_arr.index(item)
    end

    def delete(item)
        idx = index(item)
        underlying_arr.delete_at(idx)
    end

    def enqueue(item)
        underlying_arr.push(item)
    end

    def dequeue
        underlying_arr.shift
    end
end

if __FILE__ == $PROGRAM_NAME

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line") #=> ["I walk the line"]
johnny_cache.add(5) #=> ["I walk the line", 5]

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
# johnny_cache.show
johnny_cache.add(5)
# johnny_cache.show

johnny_cache.add(-5)
# johnny_cache.show
johnny_cache.add({a: 1, b: 2, c: 3})
# johnny_cache.show

johnny_cache.add([1,2,3,4])
# johnny_cache.show

johnny_cache.add("I walk the line")
# johnny_cache.show

johnny_cache.add(:ring_of_fire)
# johnny_cache.show
johnny_cache.add("I walk the line")
# johnny_cache.show
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

end