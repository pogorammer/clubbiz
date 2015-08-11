class AdminController < ApplicationController
  def validate_club
    not_admin
    @club = Club.where(club_valid: false)
  end

  def post_announcements
    not_admin
  end

  def do_post
    @all_club = Club.all
    announcement = params[:announcement]
    @all_club.each do |ac|
      ac.update_attribute('announcement', announcement)
    end
    session[:success] = "Announcement posted successfully !"
    redirect_to admin_post_announcements_path
  end

  def accept
    club = Club.find(params[:id])
    club.update_attribute('club_valid', true)
    redirect_to admin_validate_club_path
  end

  def deny
    club = Club.find(params[:id])
    club.update_attribute('club_valid', nil)
    redirect_to admin_validate_club_path
  end

  private
  def not_admin
    if session[:student_id] != 1
      redirect_to root_path
    end
  end

end
