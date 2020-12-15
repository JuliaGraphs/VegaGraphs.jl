push!(LOAD_PATH,"../src/")
using VegaGraphs

using Documenter

makedocs(sitename="VegaGraphs")

deploydocs(;
    repo="github.com/davibarreira/VegaGraphs.jl.git",
)

