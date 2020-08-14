

class Queue

    def initialize
        @queue = []
    end

    def enqueue(el)     # adds ele to back of queue
        @queue << el
    end

    def dequeue         # removes ele from front of queue
        @queue.shift
    end

    def peek            # looks at first ele without removing
        @queue[0]
    end

end

test_queue = Queue.new

p test_queue.enqueue(100)
p test_queue.enqueue(42)
p test_queue.enqueue(114)
p test_queue.enqueue(92)

p test_queue.dequeue
p test_queue.peek

p test_queue.dequeue
p test_queue.peek