push!(LOAD_PATH,"../src/")
using VegaGraphs

using Documenter

makedocs(
         sitename = "VegaGraphs.jl",
         modules  = [VegaGraphs],
         pages=[
                "Home" => "index.md"])

deploydocs(;
    repo="github.com/davibarreira/VegaGraphs.jl",
)

