using DataFrames, Random, VegaLite, SimpleWeightedGraphs, LinearAlgebra
using VegaGraphs
using Test

@testset "graphplot()" begin
    Random.seed!(7)
    incidence = rand([0,1],20,20);
    m         = incidence'*incidence
    m[diagind(m)] .= 0.0
    g = SimpleWeightedGraph(m)
    field = rand([100,200,300],20)
    p     = VegaGraphs.graphplot(g,tooltip=true,
        node_label=false,node_colorfield=field,
        node_colorfieldtype="o",node_sizefield=field)
    @test typeof(p) == VegaLite.VLSpec
end
