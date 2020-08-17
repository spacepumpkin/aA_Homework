require "byebug"
require "set"

# Defining GraphNode class -- each node has val and ref array of neighbors
class GraphNode

    attr_accessor :val, :neighbors

    def initialize(val)
        self.val = val
        self.neighbors = []
    end

    def inspect
        "#<GraphNode:#{self.object_id}x #{self.val} >"
    end

end

# Simple DFS for simple graph if we start at a good connected node
# can use an Array instead of a Set if we don't require "set"
def depth_first(node, visited = Set.new())
    return nil if visited.include?(node.val)

    puts node.val
    visited.add(node.val)

    node.neighbors.each do |neighbor|
        depth_first(neighbor, visited);
    end
end

# DFS for any graph, even with separate components (forest)
def depth_first_full(graph)
  visited = Set.new()
  graph.keys.each do |node|
    _depth_first(node, graph, visited)
  end
end

def _depth_first(node, graph, visited)
  return nil if visited.include?(node.to_sym)

  puts node
  visited.add(node.to_sym)

  graph[node.to_sym].each do |neighbor|
    _depth_first(neighbor, graph, visited)
  end
end

def breadth_first(starting_node, target_val)
    # return starting_node if starting_node.val == target_val
    visited = Set.new()
    visited.add(starting_node.val)  # don't want to repeat start node

    queue = [starting_node]

    until queue.empty?
        current_node = queue.shift
        puts current_node.val
        return current_node if current_node.val == target_val

        current_node.neighbors.each do |neighbor|
            queue.push(neighbor) unless visited.include?(neighbor.val)
            visited.add(neighbor.val)   # don't want to repeat neighbors
        end
    end
    nil
end

def breadth_first_full(graph, target_val)
    starting_node = graph.keys[0].to_sym

    visited = Set.new()
    visited.add(starting_node)  # don't want to repeat start node

    queue = [starting_node]

    graph.keys.each do |node|
        current_node = node.to_s
        queue.push(current_node) unless visited.include?(current_node)
        graph[node].each do |neighbor|
            neighbor = neighbor.to_sym
            queue.push(neighbor) unless visited.include?(neighbor)
            visited.add(neighbor)   # don't want to repeat neighbors
        end
    end

    until queue.empty?
        current_node = queue.shift
        puts current_node
        return current_node if current_node == target_val.to_sym
    end
    nil
end

def breadth_first_full2(graph, target_val)
    # until queue.empty?
    #     current_node = queue.shift
    #     puts current_node
    #     return current_node if current_node == target_val.to_sym

    #     graph.each do |node,neighbors|
    #         currentnode.neighbors.each do |neighbor|

    #         _breadth_first(node, target_val, visited)
    #     end
    # end
    # nil
end

def _breadth_first(node, target_val, visited)
    # return node if node.val == target_val
    #     current_node.neighbors.each do |neighbor|
    #       end
end

if __FILE__ == $PROGRAM_NAME

# TESTING for simple graph based on GraphNode class that starts at single node
a = GraphNode.new("a")
b = GraphNode.new("b")
c = GraphNode.new("c")
d = GraphNode.new("d")
e = GraphNode.new("e")
f = GraphNode.new("f")
a.neighbors = [b, c, e]
b.neighbors = [c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

# depth_first(f)    # prints f, e, a, b, c, d
# p breadth_first(a,"f") # prints a, b, c, e, d (but returns nil)
# p breadth_first(f,"d") # prints f, e, a, b, c, d (returns GraphNode d)

# TESTING for simple graph (all nodes connected) where we take in whole graph
graph_simple = {
  'a': ['b', 'c', 'e'],
  'b': [],
  'c': ['b', 'd'],
  'd': [],
  'e': ['a'],
  'f': ['e']
} # prints

# TESTING for forest graph (some disconnected components) where we take in whole graph
graph_forest = {
  'h': ['i', 'j'],
  'i': [],
  'j': ['k'],
  'k': [],
  'l': ['m'],
  'm': []
}

# depth_first_full(graph_simple) # prints a, b, c, d, e, f
# depth_first_full(graph_forest) # prints h, i, j, k, l, m


# UNFINISHED:

# p breadth_first_full(graph_simple, "f") # need to eliminate repeats





end
