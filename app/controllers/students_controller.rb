class StudentsController < ApplicationController
  respond_to :html

  def new
    @student = Student.new
    respond_with @student
  end

  def create
    @student = Student.create(student_params)
    respond_with @student, location: root_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :register_number, :status)
  end
end
