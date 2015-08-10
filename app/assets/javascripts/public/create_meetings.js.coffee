$(document).on "click", ".point-wrapper", (e) ->
  $point = $(e.currentTarget)
  id = $point.data "id"
  time = $point.data "time"
  $.getScript "/expositores/#{id}/meetings/new?time=#{time}"
