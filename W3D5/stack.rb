

class Stack

    def initialize   # create ivar to store stack here!
        @stack = []
    end

    def push(el)     # adds an element to the stack
        stack << el
        self        # /!\ have to protect @stack, so we can return self instead
    end

    def pop          # removes one element from the stack
        stack.pop
    end

    def peek         # returns, but doesn't remove, the top element in the stack
        stack[-1].dup
    end

    def inspect      # /!\ Can override inspect to show w/e, maybe hide instance var
        "#<Stack: #{self.object_id}>"
    end

    private         # /!\ Keeps everything below private, accessible only w/in class
    attr_reader :stack
end
# RANDOM STUFFFFFFF
# RANDOM EDIT

if __FILE__ == $PROGRAM_NAME

test_stack = Stack.new

p test_stack.push(100)
p test_stack.push(42)
p test_stack.push(114)
p test_stack.push(92)

p test_stack.pop

p test_stack.peek

end
