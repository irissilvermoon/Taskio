class TaskListsController < ApplicationController

  def new
    @task_list = current_user.task_lists.build
  end

  def create
    @task_list = current_user.task_lists.build(params[:task_list])

    if @task_list.save
      redirect_to dashboard_path, :notice => "Task list has been created."
    else
      flash[:alert] = "Task list has not been created."
      render "new"
    end
  end
end
