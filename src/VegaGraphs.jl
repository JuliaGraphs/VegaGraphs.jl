module VegaGraphs

using VegaLite
using DataStructures
using LightGraphs, GraphPlot, SimpleWeightedGraphs, LinearAlgebra, DataFrames

export graphplot
include("graph_functions.jl")
include("plotting.jl")


"""
graphplot(df)
**df** is an adjencency matrix.
This function produces an standard graph plot.
"""
function graphplot(df; kwargs...)
    g,ew = gen_graph(df)
    node_x, node_y = GraphPlot.spring_layout(g)
    graph_edges = get_edges(g,node_x,node_y);
    graph_nodes = DataFrame(keywords = names(df),node_x=node_x,node_y=node_y);

    return vl_graph_plot(graph_nodes,graph_edges;kwargs...)
end

end
