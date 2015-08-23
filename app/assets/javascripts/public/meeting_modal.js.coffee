selector = ".show-meeting-modal"

showMeetingModal = ->
  if $(selector).length > 0
    $("#{selector} .modal").modal("show")

$(document).on "ready page:load", showMeetingModal
