class CoursesController < ApplicationController
  before_filter :authorize, :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    if session[:user_id].nil?
      redirect('/')
    end

    # Select only the records for this user.
    @courses = Course.where("user_id = ?", session[:user_id]) 

    # Displays message if no courses have been added yet
    if @courses.empty?
      flash[:notice] = "Please enter your first course!"    
    end  
  end

  # GET /courses/1
  def show
    # Validate the user has access to this Course.
    current_user_id = session[:user_id]
    @course = Course.find_by_id(params[:id]);
    if @course != nil && @course.user_id != current_user_id
      redirect_to :controller => 'dashboard', :action => 'index', :notice => 'You do not have access to view this Course!'
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
    if params[:notice] != nil
      flash[:notice] = "#{params[:notice]}"  
    end
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)
    # We are also assigning the Current Users (logged in) 'id' in the new Course object located in the course_params property.

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_id, :class_name, :course_number, :details, :teacher_name, :user_id).merge(user_id: session[:user_id])
    end
end