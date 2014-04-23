class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    #select only the records for the given course param
    @exams = Exam.where("course_id = ?", params[:course_id])
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    # Construct a list of Courses that the current user has created.
    # TODO: add logic to check if @courses is nil - if so, redirect them to create a course with notice of you must first create a course!
    @courses = Course.where("user_id = ?", session[:user_id])
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
    @courses = Course.where("user_id = ?", session[:user_id])
  end

  # POST /exams
  # POST /exams.json
  def create
    # Build the new Exam object.
    selected_course = params[:select_course]
    @exam = Exam.new(exam_params)
    @exam.course_id = selected_course
  
  
    # Save.
    if @exam.save
      redirect_to :controller => 'dashboard', :action => 'index'
    else
      # Failed to create, send them back to view with errors.
      render "new"
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:exam_id, :exam_name, :details, :comments, :date_created, :date_of_exam, :is_complete, :grade_received, :course_id)
    end
end
