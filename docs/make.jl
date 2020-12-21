push!(LOAD_PATH,"../src/")
using VegaGraphs

using Documenter

makedocs(
         sitename = "VegaGraphs.jl",
         modules  = [VegaGraphs],
         pages=[
                "Home" => "index.md",
                "Internal Functions" => "int_functions.md",
               ])

deploydocs(;
    repo="github.com/davibarreira/VegaGraphs.jl",
)

