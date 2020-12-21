using DataStructures

"""
vl_graph_plot(
    df_nodes,
    df_edges,
    node_label       = true,
    node_labelsize   = 10,
    tooltip          = true,
    node_size        = 500,
    node_color       = "#9ecae9",
    node_sizefield   = nothing,
    node_colorfield  = nothing,
    node_colorscheme = "blues",
    node_opacity     = 1.0,
    edge_opacity     = 0.5,
    width            = 600,
    height           = 400
    )
Contains the VegaLite specification for producing the plot.
"""
function vl_graph_plot(
    graph_nodes,
    graph_edges;
    ew               = false,
    node_label       = true,
    node_labelsize   = 10,
    tooltip          = true,
    node_size        = 500,
    node_color       = "#9ecae9",
    node_sizefield   = nothing,
    node_colorfield  = nothing,
    node_sizefieldtype   = "q",
    node_colorfieldtype  = "q",
    node_colorscheme = "blues",
    node_opacity     = 1.0,
    edge_opacity     = 0.5,
    edge_weightfield = nothing,
    width            = 600,
    height           = 400
    )


  # Adjusting for extra fields
  if node_sizefield  != nothing
        graph_nodes[!,:node_sizefield] = node_sizefield
        node_sizefield = :node_sizefield
  end
  if node_colorfield  != nothing
        graph_nodes[!,:node_colorfield] = node_colorfield
        node_colorfield = :node_colorfield
  end

  if edge_weightfield  != nothing
        ew = true
        graph_edges[!,:ew] = edge_weightfield
        edge_weightfield = :edge_weightfield
        
  end

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
        #  tooltip={field="keywords","type"="nominal"},
        x={"node_x:q",axis=nothing},
        y={"node_y:q",axis=nothing},
        size={field=node_sizefield,
              type=node_sizefieldtype,
              legend=nothing},
        color={field=node_colorfield,
               type=node_colorfieldtype,
               scale={scheme=node_colorscheme}},
        width=width,
        height=height,
        selection={
            grid={
                    type=:interval,
                    bind=:scales,
                    }}
        },
    {
        mark={"type"=:text,clip=false,opacity=1,size=node_labelsize},
        x={"node_x:q",axis=nothing},
        y={"node_y:q",axis=nothing},
        text={"keywords","type"="nominal"}
    }]
    )


  # v2 - plotting edges
    v2 =@vlplot(
        data = graph_edges,
        layer=[
        {
          mark={"type"=:line,color="gray",clip=false,size=0.8,opacity=edge_opacity},
          encoding={
          x={"edges_x:q",axis=nothing},
          y={"edges_y:q",axis=nothing},
          detail={"pairs:o"}},
          width=width,
          height=height
        }
              ]
    );


    # Adjusting fields to avoid warnings when plotting
    if tooltip == true
      v1.layer[1]["encoding"]["tooltip"] = OrderedDict[OrderedDict("field"=>"keywords","type"=>"nominal")]
    end

    if ew == true
      v2.layer[1]["encoding"]["size"] = OrderedDict("field"=>"ew","type"=>"q","legend"=>nothing)
    end

    if node_label == false
      deleteat!(v1.layer,2)
    end

    if node_sizefield  == nothing
        delete!(v1.layer[1]["encoding"],"size")
    end
    if node_colorfield == nothing
        delete!(v1.layer[1]["encoding"],"color")
    end

    graph_plot = @vlplot(view={stroke=nothing})+v2+v1
    return graph_plot
end
