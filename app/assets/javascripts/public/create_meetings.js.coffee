$(document).on "click", ".point-wrapper", (e) ->
  $point = $(e.currentTarget)
  id = $point.data "id"
  $.getScript "/expositores/#{id}/meetings/new"
