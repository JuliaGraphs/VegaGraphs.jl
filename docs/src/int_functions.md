# VegaGraphs.jl - Internal Functions

This section constains the documentation concerning the
internal functions used in the package. These functions
are not available to the user, but might be of interest for
people interested in developing new functionality to the package.

## Plotting Function
These functions contain the Vega-Lite specifications for the plots.
```@docs
VegaGraphs.vl_graph_plot
```

## Graph Function
These functions help create the DataFrames that are passed on
to the Vega-Lite specifications.
```@docs
VegaGraphs.get_edges
```
