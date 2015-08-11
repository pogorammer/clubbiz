class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      session[:student_id] = @student.id
      redirect_to @student
    else
      render 'new'
    end
  end


  def update
    @student = Student.find(session[:student_id])
    if @student.update_attributes(student_params)
      session[:success] = "Details updated successfully !"
      redirect_to student_admin_student_edit_path
    else
      render 'student_admin/student_edit'
    end
  end


  def show
    please_sign_in
    @student = Student.find(params[:id])
  end

  private
  def please_sign_in
    if session[:student_id].nil?
      redirect_to student_admin_student_login_path
    end
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end
