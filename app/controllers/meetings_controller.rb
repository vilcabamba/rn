class MeetingsController < ApplicationController
  before_action :authenticate_user!, only: :create

  expose(:expositor)
  decorate(:expositor)
  expose(:time) {
    params[:time]
  }
  expose(:meeting) {
    Meeting.new(
      target: expositor,
      time: time
    )
  }

  def create
    meeting = MeetingScheduler.new(
      meeting_params: meeting_params,
      source: current_user.expositor
    )
    if meeting.save
      redirect_to expositor_path(expositor),
                  success: t("views.meetings.created")
    else
      redirect_to expositor_path(expositor),
                  error: t("views.meetings.not_created")
    end
  end

  private

  def meeting_params
    params.require(:meeting)
          .permit(:target_id, :time)
  end
end
