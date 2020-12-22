class CreateEventAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendees do |t|
      t.references :attend_event, foreign_key: { to_table: :events }
      t.references :attendee, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
