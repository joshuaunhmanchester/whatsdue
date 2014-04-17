class AssignmentsController < ApplicationController
  before_filter :authorize, :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  # @gallery = Gallery.find(params[:gallery_id])
  def index
    #select only the records for the given course param.
    @assignments = Assignment.where("course_id = ?", params[:course_id])
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    # <%= collection_select(:course, :course_id, @courses, :id, :class_name, options ={:prompt => "- Select a Course -"}, :class =>"course") %>
    # Construct a list of Courses that the current user has created.
    # TODO: add logic to check if @courses is nil - if so, redirect them to create a course with notice of you must first create a course!
    @courses = Course.where("user_id = ?", session[:user_id])
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
    @courses = Course.where("user_id = ?", session[:user_id])
  end

  def create
    # Build the new Assignemnt object.
    selected_course = params[:select_course]
    @assignment = Assignment.new(assignment_params)
    @assignment.course_id = selected_course

    # Save.
    if @assignment.save
      redirect_to :controller => 'dashboard', :action => 'index'
    else
      # Failed to create, send them back to view with errors.
      render "new"
    end
  end

  # POST /assignments
  # POST /assignments.json
  # def create
  #   @assignment = Assignment.new(assignment_params)

  #   respond_to do |format|
  #     if @assignment.save
  #       format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @assignment }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @assignment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:assignment_id, :assignment_name, :details, :priority, :date_created, :date_due, :is_complete, :grade_received, :select_course)
    end
end
