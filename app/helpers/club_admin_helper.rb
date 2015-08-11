module ClubAdminHelper
  def club_signed_in?
    !session[:club_id].nil?
  end

  def club_please_sign_in
    if session[:club_id].nil?
      redirect_to club_admin_club_login_path
    end
  end
end
