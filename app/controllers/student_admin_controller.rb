class StudentAdminController < ApplicationController
  def student_edit
    if session[:student_id].nil?
      redirect_to student_admin_student_login_path
    else
      @student = Student.find(session[:student_id])
    end
  end

  def student_login
    if !session[:student_id].nil?
      @student = Student.find(session[:student_id])
      redirect_to @student
    end
  end


  def login

    email = params[:email].to_s.downcase
    password = params[:password].to_s
    student = Student.find_by_email(email);

    if student && student.authenticate(password)
      session[:student_id] = student.id
      redirect_to root_path
    else
      @login_error = true
      render 'student_login'
    end
  end

  def logout
    session[:student_id] = nil
    session[:club_id] = nil
    redirect_to root_path
  end


end
