compile = []
ratio = []

$("#build").on "click", (e) ->
    Mc = M($("#c").val()).bool()
    Mr = M($("#r").val()).bool()
    
    unless Mc or Mr then return
    if $("#map").children().length > 1 then return
    
    $("#placeholder").remove()
    
    ww = parseInt $("#map").width()
    hh = parseInt $("#map").height()
    r0 = parseInt $("#c").val()
    r1 = parseInt $("#r").val()
    r2 = r0 * r1
    
    ratio = [r0,r1]

    m0 = max(ww,hh)
    m1 = max(r0,r1)

    unit = floor(m0/m1)

    for i in [0..r2-1]
        $("#map").append(
            $("<div/>")
            .addClass("tile")
            .attr("x", (i % r2))
            .attr("y", round(i / r2))
            .attr("s", -1)
            .css({
                "width": unit
                "height": unit
            })
        )
        
$(document).on "click", ".tile", (e) ->
    ts = tileStates
    state = parseInt $(this).attr("s")
    newState = (state + 1) % ts.length
    $(this)
    .attr("s", newState)
    .css("background-color", ts[newState])
        
$("#cmpl").on "click", (e) ->
    if $("#map").children().length <= 1 then return
    
    $("#map").children().each (i, el) ->
        compile.push(parseInt($(el).attr("s")))
        
    compile.unshift(ratio[1])
    compile.unshift(ratio[0])
        
    console.log (compile.join(","))
    
