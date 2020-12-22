push!(LOAD_PATH,"../src/")
using VegaGraphs

using Documenter

makedocs(
         sitename = "VegaGraphs.jl",
         modules  = [VegaGraphs],
         pages=[
                "Home" => "index.md",
                "Internal Functions" => "int_functions.md",
               ],
        format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        assets = String[],),
        )

deploydocs(;
    repo="github.com/davibarreira/VegaGraphs.jl",
)

