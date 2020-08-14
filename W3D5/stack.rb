

class Stack

    def initialize   # create ivar to store stack here!
        @stack = []
    end

    def push(el)     # adds an element to the stack
        @stack << el
    end

    def pop          # removes one element from the stack
        @stack.pop
    end

    def peek         # returns, but doesn't remove, the top element in the stack
        @stack[-1]
    end

end


test_stack = Stack.new

p test_stack.push(100)
p test_stack.push(42)
p test_stack.push(114)
p test_stack.push(92)

p test_stack.pop

p test_stack.peek