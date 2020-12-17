using DataFrames, Random, VegaLite
using VegaGraphs
using Test

@testset "graphplot()" begin
    Random.seed!(7)
    df    = DataFrame(rand([0,1],20,20));
    field = rand([100,200,300],20)
    p     = VegaGraphs.graphplot(df,tooltip=true,
        node_label=false,node_colorfield=field,
        node_colorfieldtype="o",node_sizefield=field)
    @test typeof(p) == VegaLite.VLSpec
end
