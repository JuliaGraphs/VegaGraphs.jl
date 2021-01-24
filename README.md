<div align="center"> <img
src="https://github.com/JuliaGraphs/VegaGraphs.jl/blob/master/images/VegaGraphs_logo.svg"
alt="VegaGraphs Logo" width="310"></img> </div>

<!-- [![Build Status](https://travis-ci.com/davibarreira/VegaGraphs.jl.svg?branch=master)](https://travis-ci.com/davibarreira/VegaGraphs.jl) -->
[![Coverage](https://codecov.io/gh/JuliaGraphs/VegaGraphs.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaGraphs/VegaGraphs.jl)
[![Build Status][gha-img]][gha-url]
[![][bag-stb]][bld-stb]
[![][bag-dev]][bld-dev]

**VegaGraphs** implements graph visualization with [Vega-Lite](https://github.com/queryverse/VegaLite.jl).

This library is built on top of the [JuliaGraphs](https://github.com/JuliaGraphs) project.
## Example of Usage
The use of VegaGraphs is very straightforward. At the moment, the package has one main function called
`graphplot()` that is shipped with all the possible modifications one can the do the graph visualization.

```julia
# Creating a Random Graph with SimpleWeightedGraphs
incidence = rand([0,1],10,20)
m = incidence'*incidence
m[diagind(m)] .= 0.0
g = SimpleWeightedGraph(m)
random_nodecolor = rand([1,2,3],20)

# Using VegaGraphs to create the Plot
p = VegaGraphs.graphplot(g,
    tooltip=true,  # Iteractive tooltips
    ew=true,       # VegaGraphs calculate the edge weights based on the number of time the pair appears in the graph
    node_label=false,
    node_colorfield=random_nodecolor,
    node_sizefield=field,
    node_sizefieldtype="q",
    node_colorfieldtype="o"
)
```
<div align="center"> <img
src="https://github.com/JuliaGraphs/VegaGraphs.jl/blob/master/images/Example_Plot.svg"
alt="Graph Plot"></img> </div>

## Desired Features
- [x] Graph visulization with interactivity;
- [x] Generate graph from DataFrame and generate graph from provided nodes and edges;
- [x] Allow to tweak node size, node color, node shape, edge size;
- [ ] Plot degree distribution;
- [ ] Interactivity between related graphs (e.g. papers vs authors networks);
- [ ] Interactivity between Plot and Graph (e.g. Degree distribution and Graph);
- [ ] **IMPLEMENT DIRECTED GRAPHS AFTER UNDIRECTED**

[gha-img]: https://github.com/JuliaGraphs/VegaGraphs.jl/workflows/CI/badge.svg
[gha-url]: https://github.com/JuliaGraphs/VegaGraphs.jl/actions?query=workflow%3ACI
[bag-dev]: https://img.shields.io/badge/docs-dev-blue.svg
[bld-dev]: https://juliagraphs.org/VegaGraphs.jl/dev
[bag-stb]: https://img.shields.io/badge/docs-stable-blue.svg
[bld-stb]: https://juliagraphs.org/VegaGraphs.jl/stable

