class CoursesController < ApplicationController
  respond_to :html

  def new
    @course = Course.new
    respond_with @course
  end

  def create
    @course = Course.create(course_params)
    respond_with @course, location: root_path
  end

  def add_student
    @course = Course.find(params[:id])
    @course.add_student(params[:classroom][:student_id])
    respond_with @course, location: root_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :status,
                                   classrooms_attributes: [:id, :student_id])
  end
end
