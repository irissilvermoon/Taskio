class TasksController < ApplicationController

  before_filter :authenticate_user!

  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Your task has been created.' }
      else
        flash[:alert] = "Your task was not created."
        format.html { render action: "new" }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Your task has been updated.' }
      else
        flash[:alert] = "Your task was not updated."
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, alert: 'Your task has been deleted.' }
    end
  end
end
