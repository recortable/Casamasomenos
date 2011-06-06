
Map = (data) ->
    @data = data
    @map = $("#map")

    @tree = new $jit.ST {
        injectInto: 'map',
        orientation: 'top',
        align: 'center',
        duration: 800,
        siblingOffset: 30,
        transition: $jit.Trans.Quart.easeInOut,
        levelDistance: 60,

        Node: {
            autoHeight: true,
            autoWidth: true,
            color:'#c00',
            opacity: 0,
            lineWidth: 0,
            type: 'rectangle',
            overridable: true
        },

        Edge: {
            type: 'bezier',
            color: '#c00',
            lineWidth: 2,
            overridable: true
        },

        Label : {
            overridable: false,
            type: 'HTML',
            style: ' ',
            size: 10,
            family: 'sans-serif',
            textAlign: 'center',
            textBaseline: 'alphabetic',
            color: '#fff'
        }
    }

    console.log datamap_data
    @tree.loadJSON(datamap_data)
    @tree.compute()
    @tree.geom.translate(new $jit.Complex(-200, 0), "current");
    console.log "Ready"



jQuery ->
    new Map(datamap_data);