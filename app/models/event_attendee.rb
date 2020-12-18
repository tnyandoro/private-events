class EventAttendee < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :attend_event, class_name: "Event"
end
