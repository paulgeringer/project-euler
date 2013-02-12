require 'priority_queue'
class Graph
    def initialize()
        @vertices = {}
    end

    def add_vertex(name, edges)
        @vertices[name] = edges
    end

    def to_s
        return @vertices.inspect
    end
    
    def shortest_path(start, finish)
        maxint = (2 ** (0.size * 8 -2) -1)
        distances = {}
        previous = {}
        nodes =  PriorityQueue.new
        
        @vertices.each do | vertex, value |
            if vertex == start 
                distances[vertex] = 0
                nodes[vertex] = 0
            else
                distances[vertex] = maxint
                nodes[vertex] = maxint
            end
            previous[vertex] = nil
        end

        while nodes
            smallest = nodes.delete_min_return_key
            
            if smallest == finish
                path = []
                while previous[smallest]
                    path.push(smallest)
                    smallest = previous[smallest]
                end
                return path
            end

            if distances[smallest] == maxint or smallest == nil
                break
            end
        
            @vertices[smallest].each do | neighbor, value |
                alt = distances[smallest] + @vertices[smallest][neighbor]
                if alt < distances[neighbor]
                        distances[neighbor] = alt
                        previous[neighbor] = smallest
                        nodes[neighbor] = alt
                end
            end
        end
        return distances.inspect 
    end
end

g = Graph.new
g.add_vertex('A', {'B' => 7, 'C' => 8})
g.add_vertex('B', {'A' => 7, 'F' => 2})
g.add_vertex('C', {'A' => 8, 'F' => 6, 'G' => 4})
g.add_vertex('D', {'F' => 8})
g.add_vertex('E', {'H' => 1})
g.add_vertex('F', {'B' => 2, 'C' => 6, 'D' => 8, 'G' => 9, 'H' => 3})
g.add_vertex('G', {'C' => 4, 'F' => 9})
g.add_vertex('H', {'E' => 1, 'F' => 3})
puts g.shortest_path('A', 'H')
