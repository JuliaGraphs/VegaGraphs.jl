using VegaGraphs
using Test

@testset "VegaGraphs.jl" begin
    x = 2
    y = 2
    @test VegaGraphs.sum_values(x,y) == 4
end
