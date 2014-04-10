require 'test_helper'

class ExamsControllerTest < ActionController::TestCase
  setup do
    @exam = exams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam" do
    assert_difference('Exam.count') do
      post :create, exam: { comments: @exam.comments, course_id: @exam.course_id, date_created: @exam.date_created, date_of_exam: @exam.date_of_exam, details: @exam.details, exam_id: @exam.exam_id, exam_name: @exam.exam_name, grade_received: @exam.grade_received, is_complete: @exam.is_complete }
    end

    assert_redirected_to exam_path(assigns(:exam))
  end

  test "should show exam" do
    get :show, id: @exam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exam
    assert_response :success
  end

  test "should update exam" do
    patch :update, id: @exam, exam: { comments: @exam.comments, course_id: @exam.course_id, date_created: @exam.date_created, date_of_exam: @exam.date_of_exam, details: @exam.details, exam_id: @exam.exam_id, exam_name: @exam.exam_name, grade_received: @exam.grade_received, is_complete: @exam.is_complete }
    assert_redirected_to exam_path(assigns(:exam))
  end

  test "should destroy exam" do
    assert_difference('Exam.count', -1) do
      delete :destroy, id: @exam
    end

    assert_redirected_to exams_path
  end
end
