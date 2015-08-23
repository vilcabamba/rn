class MeetingRsvp
  attr_reader :meeting

  def initialize(meeting)
    @meeting = meeting
  end

  def cancel!
    meeting.destroy
  end

  def confirm!
    meeting.send :confirm!
  end
end
