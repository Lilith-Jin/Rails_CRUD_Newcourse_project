class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find_by(id: params[:id])
  end

  def create
    # @course = Course.new(clean_params)
    # render html: params
    if Course.new(clean_params).save 
      redirect_to courses_path, notice: "course created"
    else
      render :new
    end
  end

  def edit
    # @course = Course.find_by(id: params[:id])
  end

  def update
    # @course = Course.find_by(id: params[:id])

    if @course.update(clean_params)
      # 對要存進資料庫前的course過濾
      redirect_to courses_path, notice: "course edited"
    else
      render :edit
    end

  end

  def destroy
    # @course = Course.find_by(id: params[:id])
    @course.destroy
    redirect_to courses_path, notice: "course deleted"
  end

  private
  #creat和edit都要用到
  def clean_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end
  #edit,uodate,destroy都要用到，寫成private方法，掛在before_action
  def set_course
    @course = Course.find_by(id: params[:id])
  end
end
