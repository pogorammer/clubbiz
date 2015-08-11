class EventShareController < ApplicationController
  def share
    @event = Event.find(session[:event_id])
    @share_club = Club.where('id !=' + session[:club_id].to_s)
  end

  def do_share
    @event = Event.find(session[:event_id])
    if params.count > 5
      num_share = params.count - 5

      # Create ClubEvent rel
      i = 0
      while i < Integer(num_share) do
        no = i + 1
        if params['club_' + no.to_s]
          id = Integer(params['club_' + no.to_s])
          ClubEvent.create(club_id: id, event_id: @event.id)
        end
        i += 1
      end
      session[:event_id] = nil
      redirect_to @event
    else
      session[:event_id] = nil
      redirect_to @event
    end
  end

  def post_feedback
    @event = Event.find(params[:event_id])
    @student = Student.find(session[:student_id])
    post_content = params[:post_content]
    if post_content
      Feedback.create(post: post_content, student_id: @student.id, event_id: @event.id)
    end
    redirect_to @event
  end
end
