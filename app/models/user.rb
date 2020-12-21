class User < ApplicationRecord
  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attend_events, through: :event_attendees
  has_many :organize_events, class_name: 'Event', foreign_key: :organizer_id

  validates :username, uniqueness: true

  def event_attend?(user_id, event_id)
     !(EventAttendee.where(attend_event_id: event_id, attendee_id: user_id).empty?)
  end
end
