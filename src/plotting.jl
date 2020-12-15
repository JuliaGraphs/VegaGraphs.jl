"""
vl_graph_plot(
    df_nodes,
    df_edges,
    node_color       = "#9ecae9",
    node_size_field  = nothing,
    node_color_field = nothing,
    node_color_scheme= "blues",
    node_opacity     = 0.9,
    edge_opacity     = 0.5,
    width            = 600,
    height           = 400
    )

Contains the VegaLite specification for producing the plot.
"""
function vl_graph_plot(
    graph_nodes,
    graph_edges;
    node_size        = 500,
    node_color       = "#9ecae9",
    node_size_field  = nothing,
    node_color_field = nothing,
    node_color_scheme= "blues",
    node_opacity     = 0.9,
    edge_opacity     = 0.5,
    width            = 600,
    height           = 400
    )
  # vegalite.jl plotting specification
  # v1 - plotting nodes
    v1 =@vlplot(
    data = graph_nodes,
    layer=[
    {
        mark={"type"=:circle,clip=false,
              opacity=node_opacity,
              size=node_size,
              color=node_color},
        # There is some bug with VegaLite
        # when trying to put [] aroung tooltip
        tooltip={field="keywords","type"="nominal"},
        x={"node_x:q",axis=nothing},
        y={"node_y:q",axis=nothing},
        size={field=node_size_field,legend=nothing},
        color={field=node_color_field, scale={scheme=node_color_scheme}},
        width=width,
        height=height,
        selection={
            grid={
                    type=:interval,
                    bind=:scales,
                    }}
        },
    {
        mark={"type"=:text,clip=false,opacity=1,size=10},
        x={"node_x:q",axis=nothing},
        y={"node_y:q",axis=nothing},
        text={"keywords","type"="nominal"}
    }]
    )
#
  # v2 - plotting edges
    v2 =@vlplot(
        mark={"type"=:line,color="gray",clip=false,size=0.8,opacity=edge_opacity},
        data = graph_edges,
        encoding={
        x={"edges_x:q",axis=nothing},
        y={"edges_y:q",axis=nothing},
        size={"ew:q",legend=nothing},
        detail={"pairs:o"}},
        width=width,
        height=height,
    );
    graph_plot = @vlplot(view={stroke=nothing})+v2+v1
    return graph_plot
end
