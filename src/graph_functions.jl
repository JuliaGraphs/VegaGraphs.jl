"""
get_edges(g,node_x,node_y)
g is a SimpleWeightedGraph, while node_x and node_y are
arrays containing the position of the nodes.

Return a DataFrame containing the edge information,
such as position, pairs and weights.
"""
function get_edges(g,node_x,node_y)
    edges_p1 = []
    edges_p2 = []
    edges_w  = Float64[]
    for i in edges(g)
        push!(edges_p1, i.src)
        push!(edges_p1, i.src)
        push!(edges_p2, i.dst)
        push!(edges_p2, i.dst)
        try
            push!(edges_w, i.weight)
            push!(edges_w, i.weight)
        catch e
            push!(edges_w,1)
            push!(edges_w,1)
        end
    end
    
    edges_node  = Int[]
    edges_pairs = []
    for i in 1:size(edges_p1)[1]
        if i % 2 == 0
            push!(edges_node,edges_p2[i])
        else
            push!(edges_node,edges_p1[i])
        end
        push!(edges_pairs,[edges_p1[i],edges_p2[i]])
    end 
    graph_edges = DataFrames.DataFrame(edges_x = node_x[edges_node], edges_y = node_y[edges_node],
                       pairs = edges_pairs, ew = edges_w, node = edges_node) 
    return graph_edges
  end
