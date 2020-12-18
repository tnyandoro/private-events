class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User', foreign_key: "user_id"

  has_many :event_attendee, foreign_key: "event_attendee_id"
  has_many :attendees, through: "event_attendee", source: 'users', class_name: 'User', foreign_key: "user_id"

end
