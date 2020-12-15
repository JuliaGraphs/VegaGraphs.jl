


function vl_graph_plot(
    df_nodes::DataFrame,
    df_edges::DataFrame;
    node_size        = 500,
    node_color       = "#9ecae9"
    node_size_field  = nothing,
    node_color_field = nothing,
    node_color_scheme= "blues",
    node_opacity     = 0.9,
    edge_opacity     = 0.5,
    width            = 600,
    height           = 400
    )


  # VegaLite.jl plotting specification
  

  # v1 - Plotting Nodes
    v1 =@vlplot(
    data = graph_nodes,
    layer=[
    {
        mark={"type"=:circle,clip=false,opacity=node_opacity,size=size,color=node_color},
        x={"node_x:q",axis=nothing},
        y={"node_y:q",axis=nothing},
        size={field=node_size_field,legend=nothing},
        color={field=nothing, scale={scheme=node_color_scheme}},
        tooltip=[{field="keywords","type"="nominal"}],
        width=width,
        height=height,
        selection={
            grid={
                    type=:interval,
                    bind=:scales,
                }
        }},
    { 
        mark={"type"=:text,clip=false,opacity=1,size=10},
        x={"node_x:q",axis=nothing},
        y={"node_y:q",axis=nothing},
        text={"keywords","type"="nominal"}
    }]
    )

  # v2 - Plotting Edges
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

    return graph_plot = @vlplot(view={stroke=nothing})+v2+v1
end
