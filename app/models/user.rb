class User < ApplicationRecord

  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attend_events, through: :event_attendees
  has_many :organize_events, class_name: 'Event', foreign_key: :organizer_id

  validates :username, uniqueness: true
  scope :past, -> {where("date < ?", Date.today)}
  scope :future, -> {where("date > ?", Date.today)}
end
