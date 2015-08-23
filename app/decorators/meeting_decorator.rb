class MeetingDecorator < LittleDecorator
  def point_wrapper_for(expositor)
    content_tag :div,
                class: "point-wrapper meeting-#{point_class}",
                data: {
                  time: time,
                  expositor_id: expositor.id,
                  id: record.id
                } do
      point_popover
    end
  end

  def point_popover
    content_tag :div,
                class: "bs-popover",
                data: {
                  toggle: "popover",
                  content: status_str,
                  trigger: "hover",
                  placement: "top",
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
