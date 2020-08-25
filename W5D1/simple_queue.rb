class Queue

    def initialize
        @underlying_array = []
    end

    def size
        underlying_array.size
    end

    def empty?
        underlying_array.empty?
    end

    def front
        underlying_array[0]
    end

    def back
        underlying_array[-1]
    end

    def first(n)
        underlying_array[0...n]
    end

    def last(n)
        underlying_array[-n..-1]
    end

    def enqueue(item)
        underlying_array.push(item)
    end

    def dequeue
        underlying_array.shift
    end

    # def contains?(item)
    #     underlying_array.include?(item)
    # end

    # def index(item)
    #     underlying_array.index(item)
    # end

    # def delete(item)
    #     idx = index(item)
    #     underlying_array.delete_at(idx)
    # end

    private
    attr_accessor :underlying_array

end