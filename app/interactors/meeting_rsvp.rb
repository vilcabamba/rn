class MeetingRsvp
  attr_reader :meeting

  def initialize(meeting)
    @meeting = meeting
  end

  def cancel!
    MeetingMailer.cancel_meeting(meeting).deliver_later
    meeting.destroy
  end

  def confirm!
    meeting.send :confirm!
    MeetingMailer.confirm_meeting(meeting).deliver_later
  end
end
