applyPopovers = ->
  $(".bs-popover").popover()

$(document).on "ready page:load", applyPopovers
