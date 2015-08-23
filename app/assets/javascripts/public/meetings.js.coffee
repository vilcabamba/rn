class MeetingListener
  wrapper: ".point-wrapper"

  constructor: ->
    $(document).on "click",
                   @selector(),
                   $.proxy(@clicked, @)

  clicked: (e) ->
    $point = $(e.currentTarget)
    @onClick(
      expositorId: $point.data("expositor-id"),
      time: $point.data("time"),
      id: $point.data("id")
    )

class MeetingAvailableListener extends MeetingListener
  selector: ->
    @wrapper + ".meeting-available"

  onClick: (options) ->
    $.getScript "/expositores/#{options.expositorId}/meetings/new?time=#{options.time}"

class ScheduledMeetingListener extends MeetingListener
  selector: ->
    @wrapper + ".meeting-pending," + @wrapper + ".meeting-busy"

  onClick: (options) ->
    $.getScript "/expositores/#{options.expositorId}/meetings/#{options.id}"

new MeetingAvailableListener()
new ScheduledMeetingListener()
