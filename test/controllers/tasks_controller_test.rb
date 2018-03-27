require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { category_id: @task.category_id, conclusion_at: @task.conclusion_at, description: @task.description, effort_min: @task.effort_min, finish_at: @task.finish_at, open_user_id: @task.open_user_id, priority: @task.priority, project_id: @task.project_id, start_at: @task.start_at, status_id: @task.status_id, title: @task.title, user_id: @task.user_id, worked_min: @task.worked_min } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { category_id: @task.category_id, conclusion_at: @task.conclusion_at, description: @task.description, effort_min: @task.effort_min, finish_at: @task.finish_at, open_user_id: @task.open_user_id, priority: @task.priority, project_id: @task.project_id, start_at: @task.start_at, status_id: @task.status_id, title: @task.title, user_id: @task.user_id, worked_min: @task.worked_min } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
