module StudentAdminHelper
  def student_signed_in?
    !session[:student_id].nil?
  end

  def get_current_student
    Student.find(session[:student_id])
  end

  def please_sign_in
    if session[:student_id].nil?
      redirect_to student_admin_student_login_path
    end
  end
end
