class TasksController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_task_list

  def index
    @tasks = @task_list.tasks.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = @task_list.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = @task_list.tasks.build(params[:task]){ |task| task.user = current_user }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = @task_list.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @task_list.tasks.build(params[:task])
    @task.user = current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_list_tasks_path(@task_list), notice: 'Your task has been created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        flash[:alert] = "Your task was not created."
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = @task_list.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to task_list_task_path(@task_list), notice: 'Your task has been updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = @task_list.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to task_list_tasks_path(@task_list), notice: "Item has been deleted" }
      format.json { head :no_content }
    end
  end

  private

  def find_task_list
    @task_list = current_user.task_lists.find(params[:task_list_id])
  end
end
