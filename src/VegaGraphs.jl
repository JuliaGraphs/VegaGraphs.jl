module VegaGraphs

using VegaLite
using GraphPlot, SimpleWeightedGraphs, LinearAlgebra, DataFrames

export graphplot
include("graph_functions.jl")
include("plot_functions.jl")

  function graphplot(df)
      g,ew = gen_graph(df)
      node_x, node_y = GraphPlot.spring_layout(g)
      graph_edges = get_edges(g,node_x,node_y);
      graph_nodes = DataFrame(keywords = names(df),
                              node_x=node_x,
                              node_y=node_y);

      return vl_graphplot(graph_nodes,graph_edges)
  end

end
