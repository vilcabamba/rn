options =
  html: true
  placement: "bottom"
  container: "body"
  trigger: "manual"
  content: ->
    $(this).find(".current-user-actions").html()

$(document).on "click", ".current-user-resume", ->
  $this = $(this)
  $this.popover(options).popover("toggle")
  $this.on "hidden.bs.popover", ->
    $this.popover "destroy"
