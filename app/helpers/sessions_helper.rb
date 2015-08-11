module SessionsHelper
  def sign_in(student)
    remember_token = Student.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    student.update_attribute(:remember_token, Student.digest(remember_token))
    self.current_student = student
  end

  def current_student=(student)
    @current_student = student
  end

  def current_student
    remember_token = Student.digest(cookies[:remember_token])
    @current_student ||= Student.find_by(remember_token: remember_token)
  end

  def signed_in?
    !current_student.nil?
  end

  def sign_out
    current_student.update_attribute(:remember_token,
                                     Student.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_student = nil
  end
end