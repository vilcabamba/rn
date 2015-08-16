class MeetingMailer < ApplicationMailer
  def schedule_new(meeting)
    @meeting = meeting
    mail(
      to: meeting.target.user.email,
      subject: "#{meeting.source.company} quiere reunirse contigo"
    )
  end
end
