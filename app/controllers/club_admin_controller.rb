class ClubAdminController < ApplicationController
  def club_edit
    if session[:club_id].nil?
      redirect_to club_admin_club_login_path
    else
      @club = Club.find(session[:club_id])
    end
  end

  def club_post
    if session[:club_id].nil?
      redirect_to club_admin_club_login_path
    else
      @club = Club.find(session[:club_id])
    end
  end

  def event_report
    @club = Club.find(session[:club_id])
    @club_events = @club.club_events
    @event = Array.new
    if @club_events.count > 0
      @club_events.each do |ce|
        @event.append(Event.find(ce.event_id))
      end
    end
  end

  def post
    if ClubPost.create(post: params[:post_content], club_id: session[:club_id])
      session[:success] = "Announcement posted successfully !"
      redirect_to club_admin_club_post_path
    end
  end

  def club_login
    if !session[:club_id].nil?
      @club = Club.find(session[:club_id])
      redirect_to @club
    end
  end

  def login
    @login_error = nil

    login_id = params[:club_login_id].to_s.downcase
    password = params[:password].to_s
    club = Club.find_by_club_login(login_id)
    if club && club.authenticate(password) && club.club_valid
      session[:club_id] = club.id
      redirect_to club_admin_club_edit_path
    else
      if club
        if club.club_valid.nil?
          @club_not_valid = 1
        end
        if club.club_valid == false
          @club_not_validated = 1
        end
      else
        @login_error = true
      end

      render 'club_login'
    end
  end

  def logout
    session[:club_id] = nil
    redirect_to club_admin_club_login_path
  end

end
