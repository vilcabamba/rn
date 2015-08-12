class MeetingDecorator < LittleDecorator
  def point_wrapper_for(expositor)
    content_tag :div,
                class: "point-wrapper bs-popover meeting-#{point_class}",
                data: {
                  time: time,
                  toggle: "popover",
                  content: status_str,
                  trigger: "hover",
                  placement: "top",
                  id: expositor.id
                } do
      point.html_safe + point_time.html_safe
    end
  end

  def point
    content_tag :div,
                nil,
                class: "point point-#{point_class}"
  end

  def status_str
    t("views.meetings.#{point_class}")
  end

  def point_time
    time_str = time.split(":").first+"h" if time =~ /:00/
    content_tag(
      :span,
      time_str,
      class: "point-time"
    )
  end

  private

  def point_class
    @point_class ||= if new_record?
      "available"
    elsif pending?
      "pending"
    else
      "busy"
    end
  end
end
