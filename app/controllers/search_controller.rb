class SearchController < ApplicationController
  def do_search
    @query = params[:search]
    @search_club = Club.search(@query)
    @search_event = Event.search(@query)

  end
end
