class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'

  has_many :event_attendees, foreign_key: 'event_attendee_id'
  has_many :attendees, class_name: 'User', through: :event_attendees, source: :attendee

end
