class TasksController < ApplicationController
  require 'date'
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, except: [:create, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @task_playing = @tasks.played.last
    @task_paused  = @tasks.paused.last
    today = Date.today.strftime("%d/%m/%y")
    tomorrow_date = Date.today + 1.day
    tomorrow = tomorrow_date.strftime("%d/%m/%y")
    @task = Task.new(effort_min: 480, start_at: today, conclusion_at: tomorrow)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    def show
      respond_to do |format|
        format.html
        format.json
        format.js
      end
    end
  end

  # GET /tasks/new
  def new
    today = Date.today.strftime("%d/%m/%y")
    tomorrow_date = Date.today + 1.day
    tomorrow = tomorrow_date.strftime("%d/%m/%y")
    @task = Task.new(effort_min: 480, start_at: today, conclusion_at: tomorrow)
  end

  def play_pause
    @task = Task.find(params[:task_id])
    
    if @task.pause?
      new_status = 2
    else
      new_status = 3
    end

    if @task.play_pause!
      ActivityTask.create(task_id: @task.id, status_id: new_status)
      @msg = "Tarefa #{@task.status.name} com sucesso"
    else
      @msg = "Erro"
    end
    
    render json: {
      status: 200,
      message: @msg,
      new_status: new_status
    }.to_json

  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    # @task = Task.new(task_params)
    @task_new = Task.new(task_params)
    @tasks = Task.all
    respond_to do |format|
      if @task_new.save
        format.html { redirect_to @task_new, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
        format.js  
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:status_id, :project_id, :category_id, :open_user_id, :user_id, :title, :description, :start_at, :conclusion_at, :finish_at, :effort_min, :worked_min, :priority)
    end
end
