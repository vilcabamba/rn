class MeetingScheduler
  attr_reader :meeting_params, :source

  def initialize(options)
    @source = options.fetch(:source)
    @meeting_params = options.fetch(:meeting_params)
  end

  def save
    meeting.save.tap do |saved|
      if saved
        MeetingMailer.schedule_new(meeting).deliver_later
      end
    end
  end

  private

  def meeting
    @meeting ||= Meeting.new(meeting_params).tap do |meeting|
      meeting.source = source
    end
  end
end
