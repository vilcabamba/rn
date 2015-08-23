class MeetingMailer < ApplicationMailer
  def schedule_new(meeting)
    @meeting = meeting
    mail(
      to: meeting.target.user.email,
      subject: "#{meeting.source.company} quiere reunirse contigo"
    )
  end

  def cancel_meeting(meeting)
    @meeting = meeting
    mail(
      to: meeting.source.user.email,
      subject: "#{meeting.target.company} ha rechazado la reunión"
    )
  end

  def confirm_meeting(meeting)
    @meeting = meeting
    mail(
      to: meeting.source.user.email,
      subject: "#{meeting.target.company} ha confirmado la reunión"
    )
  end
end
