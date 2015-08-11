class EventController < ApplicationController
  def new
    club_please_sign_in
    @club = Club.find(session[:club_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    num_events = params.to_a[-4][0].split('_')[1]

    # Create Tickets
    if @event.save
      i = 0
      while i < Integer(num_events) do
        no = i + 1
        Ticket.create(ticket_type: params['ticket_' + no.to_s + '_type'],
                      ticket_price: params['ticket_' + no.to_s + '_price'],
                      start_date: params['ticket_' + no.to_s + '_start_date'],
                      end_date: params['ticket_' + no.to_s + '_end_date'], event_id: @event.id,
                      amount: params['ticket_' + no.to_s + '_amount'])
        i += 1
      end

      # Create ClubEvent Rel
      ClubEvent.create(club_id: session[:club_id], event_id: @event.id)

      # Share Event
      if !params[:share_event].nil?
        session[:event_id] = @event.id
        redirect_to event_share_share_path
      else
        redirect_to @event
      end
    else
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @tickets = @event.tickets
    if student_signed_in?
      @student = Student.find(session[:student_id])
    end
    @feedback = @event.feedbacks.order('created_at desc')
  end

  private
  def event_params
    params.require(:event).permit(:title, :datetime, :img1, :img2, :img3, :url, :description)
  end
end
