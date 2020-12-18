class User < ApplicationRecord
  has_many :events_created, class_name: "Event", foreign_key: "user_id"

  has_many :event_attendees, foreign_key: "event_attendee_id"
  has_many :event_attend, through: "event_attendee", class_name: "Event", foreign_key: "event_id"

  validates :username, uniqueness: true
end
