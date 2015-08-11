class ClubController < ApplicationController
  def new
    please_sign_in
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    num_bearers = params.to_a[-4][0].split('_')[1]
    if @club.save
      i = 0
      while i < Integer(num_bearers) do
        no = i + 1
        is_administrator = false
        if params['bearer_' + no.to_s + '_admin'].to_s != ""
          is_administrator = true
        end
        Bearer.create(name: params['bearer_' + no.to_s + '_name'],
                      phone: params['bearer_' + no.to_s + '_phone'],
                      email: params['bearer_' + no.to_s + '_email'],
                      position: params['bearer_' + no.to_s + '_position'],
                      is_administrator: is_administrator, club_id: @club.id)
        i += 1
      end
      redirect_to @club
    else
      render 'new'
    end
  end

  def update
    @club = Club.find(session[:club_id])
    if @club.update_attributes(club_params)
      session[:success] = "Details updated successfully !"
      redirect_to club_admin_club_edit_path
    else
      render 'club_admin/club_edit'
    end
  end

  def show
    @club = Club.find(params[:id])
    @club_events = @club.club_events
    @events = Array.new
    if @club_events.count > 0
      @club_events.each do |ce|
        @events.append(Event.find(ce.event_id))
      end
    end
  end

  private
  def club_params
    params.require(:club).permit(:club_name, :club_number, :url, :club_login, :password, :password_confirmation, :avatar)
  end
end
