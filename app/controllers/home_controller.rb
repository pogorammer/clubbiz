class HomeController < ApplicationController
  def index
    @all_club = Club.all
    @events = Array.new
    @all_events = Event.order('created_at desc').limit(30)
    @all_events.each do |e|
      @events.append(Event.find(e.id))
    end
  end
end
