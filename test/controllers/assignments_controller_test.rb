require 'test_helper'

class AssignmentsControllerTest < ActionController::TestCase
  setup do
    @assignment = assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post :create, assignment: { assignment_id: @assignment.assignment_id, assignment_name: @assignment.assignment_name, cours_id: @assignment.cours_id, date_created: @assignment.date_created, date_due: @assignment.date_due, details: @assignment.details, grade_received: @assignment.grade_received, is_complete: @assignment.is_complete, priority: @assignment.priority }
    end

    assert_redirected_to assignment_path(assigns(:assignment))
  end

  test "should show assignment" do
    get :show, id: @assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assignment
    assert_response :success
  end

  test "should update assignment" do
    patch :update, id: @assignment, assignment: { assignment_id: @assignment.assignment_id, assignment_name: @assignment.assignment_name, cours_id: @assignment.cours_id, date_created: @assignment.date_created, date_due: @assignment.date_due, details: @assignment.details, grade_received: @assignment.grade_received, is_complete: @assignment.is_complete, priority: @assignment.priority }
    assert_redirected_to assignment_path(assigns(:assignment))
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete :destroy, id: @assignment
    end

    assert_redirected_to assignments_path
  end
end
