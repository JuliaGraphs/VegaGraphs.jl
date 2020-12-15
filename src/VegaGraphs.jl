module VegaGraphs

using VegaLite
using DataStructures
using LightGraphs, GraphPlot, SimpleWeightedGraphs, LinearAlgebra, DataFrames

export graphplot
include("graph_functions.jl")
include("plotting.jl")


"""
graphplot(df, layout = GraphPlot.spring_layout; kwargs...)

Input:
* df is an adjencency matrix.
* layout is a GraphPlot layout function (e.g GraphPlot.circular_layout)

This function produces an standard graph plot.
The possible arguments to be used are the following:
* node_label       = true
* node_labelsize   = 10
* tooltip          = true
* node_size        = 500
* node_color       = "#9ecae9"
* node_sizefield   = nothing
* node_colorfield  = nothing
* node_colorscheme = "blues"
* node_opacity     = 1.0
* edge_opacity     = 0.5
* width            = 600
* height           = 400
"""
function graphplot(df, layout = GraphPlot.spring_layout; kwargs...)
    g,ew = gen_graph(df)
    node_x, node_y = layout(g)
    graph_edges = get_edges(g,node_x,node_y);
    graph_nodes = DataFrame(keywords = names(df),node_x=node_x,node_y=node_y);

    return vl_graph_plot(graph_nodes,graph_edges;kwargs...)
end

end
