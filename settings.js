// Generated by CoffeeScript 1.7.1
(function() {
  window.tileStates = [];

  $("#t").on("click", function(e) {
    return $("#types").append($("<div/>").addClass("form-inline").append($("<button type='button'/>").addClass("btn btn-default color-box")).append($("<input type='text'>").addClass("form-control type").attr("placeholder", "Name")));
  });

  $(document).on("click", ".color-box", function(e) {
    $(".active-box").each(function() {
      return $(this).removeClass("active-box");
    });
    $(this).addClass("active-box");
    if ($(".popup") !== void 0) {
      $(".popup").remove();
    }
    $("#app").append($("<div/>").addClass("popup").append($("<input type='text'>").addClass("form-control popup-input")).on("keydown", function(e) {
      if (e.keyCode === 27) {
        return $(this).remove();
      }
    }));
    return $(".popup-input").focus();
  });

  $(document).on("keydown", ".popup-input", function(e) {
    var $popi, $this, color;
    if (e.keyCode === 13) {
      $(".popup").remove();
      $popi = $(this);
      $this = $(".active-box");
      color = $(this).val();
      if (color.toLowerCase() === "remove") {
        if ($this.siblings().attr("state")) {
          tileStates.splice(parseInt($this.siblings().attr("state")), 1);
        }
        $this.parent().remove();
      }
      $(".active-box").css("background", $(this).val()).removeClass("active-box");
      return setTimeout((function() {
        return $this.focus();
      }), 100);
    }
  });

  $(document).on("keydown", ".type", function(e) {
    var color, name, parent;
    if (e.keyCode === 13) {
      name = $(this).val();
      if (name.toLowerCase() === "remove") {
        if ($(this).attr("state")) {
          tileStates.splice(parseInt($(this).attr("state")), 1);
        }
        $(this).parent().remove();
      }
      parent = $(this).parent();
      color = $(parent.children()[0]).css("background-color");
      $(this).remove();
      parent.append($("<span/>").addClass("type-name").attr("state", tileStates.length).text(" " + name));
      return tileStates.push(color);
    }
  });

  $(document).on("dblclick", ".type-name", function(e) {
    var name, parent;
    name = $(this).text();
    parent = $(this).parent();
    $(this).remove();
    return parent.append($("<input type='text'>").addClass("form-control type").attr("placeholder", "Name").val(name));
  });

}).call(this);