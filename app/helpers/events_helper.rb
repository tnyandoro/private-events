module EventsHelper

  def organizer(event)
    User.find(event.organizer_id)
  end

  def upcoming_event_button(event_id, current_user=nil)
    if logged_in?
      current_user_id = current_user.id
      if !(current_user.event_attend?(current_user_id, event_id))
        btn_label = 'Attend Event'
        btn_path = attend_path(id: event_id)
        btn_class = 'btn btn-primary'
      else
        btn_label = 'Attending'
        btn_path = '#'
        btn_class = 'btn btn-success'
      end
    else
      btn_label = 'Sign In To Attend Event'
      btn_path = signin_path
      btn_class = 'btn btn-warning'
    end
    [btn_label,btn_path,btn_class]
  end

  def past_event_button(event_id, current_user_id=nil)
     return ["","",""] unless logged_in?
     if !(current_user.event_attend?(current_user_id, event_id))
        btn_label = 'Did not attend'
        btn_path = '#'
        btn_class = 'btn btn-warning'
     else
        btn_label = 'Attended'
        btn_path = '#'
        btn_class = 'btn btn-success'
     end
     [btn_label,btn_path,btn_class]
  end
end
