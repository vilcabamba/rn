class ExpositorDecorator < LittleDecorator
  def country
    countries = ISO3166::Country.translations(I18n.locale)
    countries.fetch(record.country)
  end

  def photo
    uri = record.photo? ? record.photo_url : "/imageplaceholder.svg"
    image_tag uri, class: "img-square"
  end

  def photo_for_carousel
    if record.photo?
      image_tag record.photo_url,
                class: "img-circle photo-on-carousel"
    else
      content_tag :div,
                  initials,
                  class: "img-circle photo-on-carousel without-logo"
    end
  end

  def initials
    company.split(" ").first(2).map(&:first).join.upcase
  end

  def email
    link_to user.email, "mailto:#{user.email}"
  end

  def phone
    link_to record.phone, "tel:#{record.phone}"
  end

  def self_edit_link
    if current_user && current_user == record.user
      link_to "", me_path, class: "glyphicon glyphicon-pencil"
    end
  end

  def social_icons
    Expositor::SOCIAL_NETWORKS.map do |network|
      if record.send(network).present?
        link_to "",
                social_link(network),
                class: "mk-social-#{network}",
                target: "_blank"
      end
    end.join.html_safe
  end

  def day_meetings
    @day_meetings ||= begin
      Meeting::ALLOWED_TIMES.map do |hour|
        decorate(
          meetings_by_time.fetch(hour) {
            Meeting.new(time: hour)
          }
        )
      end
    end
  end

  private

  def meetings_by_time
    @meetings_by_time ||= record.meetings.inject({}) do |memo, meeting|
      memo[meeting.time] = meeting
      memo
    end
  end

  def social_link(network)
    nickname = record.send(network)
    case network
    when "facebook"
      "http://facebook.com/#{nickname}"
    when "twitter"
      "http://twitter.com/#{nickname}"
    when "skype"
      "skype:#{nickname}?call"
    when "instagram"
      "http://instagram.com/#{nickname}"
    end
  end
end
