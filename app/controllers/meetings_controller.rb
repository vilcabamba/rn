class MeetingsController < ApplicationController
  before_action :authenticate_user!, only: :create

  expose(:expositor)
  decorate(:expositor)
  expose(:time) {
    params[:time]
  }
  expose(:meeting) {
    if params[:id].present?
      Meeting.find params[:id]
    else
      Meeting.new(
        target: expositor,
        time: time
      )
    end
  }
  decorate(:meeting)
  expose(:other_target) {
    decorated_meeting.other_side(expositor)
  }

  def create
    scheduler = MeetingScheduler.new(
      meeting_params: meeting_params,
      source: current_user.expositor
    )
    if scheduler.save
      redirect_to expositor_path(expositor),
                  success: t("views.meetings.created")
    else
      redirect_to expositor_path(expositor),
                  error: t("views.meetings.not_created")
    end
  end

  def show
    respond_to do |format|
      format.html { show_html }
      format.js
    end
  end

  def cancel
    MeetingRsvp.new(meeting).cancel!
    redirect_to expositor_path(expositor),
                alert: t("views.meetings.canceled")
  end

  def confirm
    MeetingRsvp.new(meeting).confirm!
    redirect_to expositor_meeting_path(expositor, meeting),
                success: t("views.meetings.confirmed")
  end

  private

  def show_html
    # expositor's breadcrumbs
    add_breadcrumb t("views.home.index"),
                   :root_path
    add_breadcrumb t("views.home.expositores"),
                   :expositores_path
    add_breadcrumb expositor.category.name
    add_breadcrumb expositor.company
    render "expositores/show"
  end

  def meeting_params
    params.require(:meeting)
          .permit(:target_id, :time)
  end
end
