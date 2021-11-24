class CoursesController < ApplicationController
  def index
    @Course = Course.all
  end

  def new
    @course = Course.new
  end
end
