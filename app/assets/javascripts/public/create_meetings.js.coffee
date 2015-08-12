selector = ".point-wrapper.meeting-available"
$(document).on "click", selector, (e) ->
  $point = $(e.currentTarget)
  id = $point.data "id"
  time = $point.data "time"
  $.getScript "/expositores/#{id}/meetings/new?time=#{time}"
