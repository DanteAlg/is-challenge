class HomeController < ApplicationController
  respond_to :html

  def index
    @students = Student.all
    @courses = Course.all.includes(:classrooms)
  end
end
