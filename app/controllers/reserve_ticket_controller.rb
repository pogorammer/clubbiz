class ReserveTicketController < ApplicationController
  def reserve
    please_sign_in
    session[:event_id] = params[:id]
    @event = Event.find(session[:event_id])
    @ticket = @event.tickets.where('tickets.amount > 0')
  end

  def do_reserve
    @event = Event.find(session[:event_id])
    @ticket = @event.tickets.where('tickets.amount > 0')
    @student = Student.find(session[:student_id])

    num_ticket = (params.count - 5) / 2
    # Deduct ticket amount
    i = 0
    while i < Integer(num_ticket) do
      no = i + 1
      id = Integer(params['ticket_' + no.to_s + '_id'])

      currentTicket = Ticket.find(id)
      amount =  Integer(params['ticket_' + no.to_s])
      amount_left = currentTicket.amount - amount
      paid_amount = currentTicket.ticket_price * amount

      if (amount > 0)
        # Update Ticket Amount
        currentTicket.update_attribute('amount', amount_left)

        # Create StudentTicket Rel
        StudentTicket.create(student_id: @student.id, ticket_id: currentTicket.id, event_id: @event.id, amount: amount, paid: paid_amount)
      end
      i += 1
    end

    redirect_to @event
  end
end
