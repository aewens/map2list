window.tileStates = []

$("#t").on "click", (e) ->
    $("#types")
    .append(
        $("<div/>")
        .addClass("form-inline")
        .append(
            $("<button type='button'/>")
            .addClass("btn btn-default color-box")
        )
        .append(
            $("<input type='text'>")
            .addClass("form-control type")
            .attr("placeholder","Name")
        )
    )

$(document).on "click", ".color-box", (e) ->
    $(".active-box").each -> $(this).removeClass("active-box")
    $(this).addClass("active-box")
    if $(".popup") != undefined then $(".popup").remove()
    $("#app")
    .append(
        $("<div/>")
        .addClass("popup")
        .append(
            $("<input type='text'>")
            .addClass("form-control popup-input")
        )
        .on "keydown", (e) -> if e.keyCode == 27 then $(this).remove()
    )
    $(".popup-input").focus()

$(document).on "keydown", ".popup-input", (e) ->
    if e.keyCode == 13
        $(".popup").remove()
        $popi = $(this)
        $this = $(".active-box")
        color = $(this).val()
        if color.toLowerCase() == "remove"
            if $this.siblings().attr("state")
                tileStates.splice(parseInt($this.siblings().attr("state")), 1)
            $this.parent().remove()
        $(".active-box")
        .css("background", $(this).val())
        .removeClass("active-box")
        
        # This is a hack and I know
        setTimeout((-> $this.focus()), 100)
        
$(document).on "keydown", ".type", (e) ->
    if e.keyCode == 13
        name = $(this).val()
        if name.toLowerCase() == "remove"
            if $(this).attr("state")
                tileStates.splice(parseInt($(this).attr("state")), 1)
            $(this).parent().remove()
        parent = $(this).parent()
        color = $(parent.children()[0]).css("background-color")
        $(this).remove()
        parent
        .append(
            $("<span/>")
            .addClass("type-name")
            .attr("state", tileStates.length)
            .text(" #{name}")
        )
        tileStates.push(color)
        # console.log tileStates
        
$(document).on "dblclick", ".type-name", (e) ->
    name = $(this).text()
    parent = $(this).parent()
    $(this).remove()
    parent
    .append(
        $("<input type='text'>")
        .addClass("form-control type")
        .attr("placeholder","Name")
        .val(name)
        
    )
