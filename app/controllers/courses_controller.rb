class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
  end

  def create
    @course = Course.new(clean_params)

    if @course.save
      redirect_to courses_path, notice: "course created"
    else
      render :new
    end
  end

  def clean_params
    params.require(:course).permit(:name, :price, :intro, :hour)
    
  end

  def edit
  end

  def update
  end

  def delete
  end


end
