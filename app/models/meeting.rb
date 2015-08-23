# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  source_id  :integer          not null
#  target_id  :integer          not null
#  time       :string           not null
#  status     :integer          default("0"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Meeting < ActiveRecord::Base
  enum status: [:pending, :accepted]

  HOUR_FROM = 9
  HOUR_TO = 18
  ALLOWED_TIMES = (HOUR_FROM..HOUR_TO).map do |hour|
    # 9:00 9:30
    [
      "#{hour}:00",
      "#{hour}:30"
    ]
  end.flatten

  begin :validations
    validates :source_id, presence: true
    validates :target_id, presence: true
    validates :time, presence: true
    validate :time_is_unique
    validate :source_and_target_valid
    validate :time_format
    validate :meeting_not_existent
  end

  belongs_to :source, class: Expositor,
                      inverse_of: :direct_meetings
  belongs_to :target, class: Expositor,
                      inverse_of: :inverse_meetings

  private

  def meeting_not_existent
    errors.add(
      :target,
      "Ya existe una reunión programada"
    ) if self.class.exists?(
      source_id: source_id,
      target_id: target_id
    )
  end

  def time_format
    errors.add(
      :time,
      "Formato: H:MM"
    ) unless ALLOWED_TIMES.include?(time)
  end

  def source_and_target_valid
    errors.add(
      :target_id,
      "No puede reunirse consigo mismo"
    ) if source_id == target_id
  end

  def confirm!
    self.status = :accepted
    save validate: false
  end

  def time_is_unique
    time_invalid = %w(source target).any? do |prefix|
      self.class.where.not(id: id).exists?(
        source_id: send("#{prefix}_id"),
        time: time
      ) or self.class.where.not(id: id).exists?(
        target_id: send("#{prefix}_id"),
        time: time
      )
    end

    errors.add(
      :time,
      "Ya existe una reunión programada a esa hora"
    ) if time_invalid
  end
end
