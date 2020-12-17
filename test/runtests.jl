using DataFrames, Random
using VegaGraphs
using Test

@testset "graphplot()" begin
    Random.seed!(7)
    df = DataFrame(rand([0,1],20,20));
    field= rand([100,200,300],20)
    VegaGraphs.graphplot(df,tooltip=true,
        node_label=false,node_colorfield=field,
        node_colorfieldtype="o",node_sizefield=field)
    @test 1 == 1
end
