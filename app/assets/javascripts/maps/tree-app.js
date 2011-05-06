$(function() {

    var labelType, useGradients, nativeTextSupport, animate;
    var tree;

    (function() {
        var ua = navigator.userAgent,
                iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i),
                typeOfCanvas = typeof HTMLCanvasElement,
                nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'),
                textSupport = nativeCanvasSupport
                        && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
        //I'm setting this based on the fact that ExCanvas provides text support for IE
        //and that as of today iPhone/iPad current text support is lame
        labelType = (!nativeCanvasSupport || (textSupport && !iStuff)) ? 'Native' : 'HTML';
        nativeTextSupport = labelType == 'Native';
        useGradients = nativeCanvasSupport;
        animate = !(iStuff || !nativeCanvasSupport);
    })();

    $.fn.disableSelection = function() {
        $(this).attr('unselectable', 'on')
                .css('-moz-user-select', 'none')
                .each(function() {
            this.onselectstart = function() {
                return false;
            };
        });
    };

    $(function() {
        init();
    });

    function openNode(node) {
        $("#page-view").hide();
        $.getScript('/articulos/' + node.id + ".js");
    }

    var lastLabel = {style : {}};

    function onLabelClicked(label, node) {
        lastLabel.style.backgroundColor = colorDefault;
        tree.onClick(node.id);
        openNode(node);
        label.style.backgroundColor = colorActive;
        lastLabel = label;
    }

    var colorDefault = '#0389BA';
    var colorActive = "#40CAFC";


    function init() {
        tree = new $jit.ST({
            injectInto: 'infovis',
            orientation: 'top',
            align: 'center',
            duration: 800,
            siblingOffset: 30,
            transition: $jit.Trans.Quart.easeInOut,
            levelDistance: 60,

            Navigation: {
                enable:true,
                panning:true
            },
            //set node and edge styles
            //set overridable=true for styling individual
            //nodes or edges
            Node: {
                autoHeight: true,
                autoWidth: true,
                color:colorDefault,
                opacity: 0,
                lineWidth: 0,
                type: 'rectangle',
                overridable: true
            },

            Edge: {
                type: 'bezier',
                color: colorDefault,
                lineWidth: 2,
                overridable: true
            },

            Label : {
            },

            onBeforeCompute: function(node) {
            },

            onAfterCompute: function() {
            },

            //This method is called on DOM label creation.
            //Use this method to add event handlers and styles to
            //your node.
            onCreateLabel: function(label, node) {
                label.id = node.id;
                label.innerHTML = node.name;
                label.onclick = function() {
                    onLabelClicked(label, node);
                };
                //set label styles
                var style = label.style;
                $(label).disableSelection();
                style.cursor = 'pointer';
                style.color = 'white';
                style.textShadow = '';
                style.textWrap = 'avoid';
                style.boxShadow = '1px 1px 5px #555';
                if (node.selected) {
                    style.backgroundColor = colorActive;
                    lastLabel = label;
                } else {
                    style.backgroundColor = colorDefault;
                }
                style.fontSize = '1em';
                style.textAlign = 'center';
                style.padding = '6px 10px';
                style.margin = '-5px 0 0 -3px'
            },

            onBeforePlotNode: function(node) {
                //add some color to the nodes in the path between the
                //root node and the selected node.
                if (node.selected) {
                    node.data.$color = colorActive;
                }
                else {
                    delete node.data.$color;
                    //if the node belongs to the last plotted level
                    if (!node.anySubnode("exist")) {
                        //count children number
                        var count = 0;
                        node.eachSubnode(function(n) {
                            count++;
                        });
                    }
                }
            },

            onBeforePlotLine: function(adj) {
                if (adj.nodeFrom.selected && adj.nodeTo.selected) {
                    adj.data.$color = colorActive;
                    adj.data.$lineWidth = 3;
                }
                else {
                    delete adj.data.$color;
                    delete adj.data.$lineWidth;
                }
            }
        });
        //load json data
        tree.loadJSON(datamap_data);
        //compute node positions and layout
        tree.compute();
        //optional: make a translation of the tree
        //st.geom.translate("current", new $jit.Complex(0, -200));
        //st.geom.translate(new $jit.Complex(-200, 200), "current");
        //emulate a click on the root node.
        tree.onClick(tree.root, {
            Move: {
                enable: true,
                offsetX: 0,
                offsetY: 0
            }
        });
        //end
    }
})();

