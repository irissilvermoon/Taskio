class GroupsController < ApplicationController

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(params[:group])

    if @group.save
      redirect_to dashboard_path, :notice => "Group has been created."
    else
      flash[:alert] = "Group has not been created."
      render "new"
    end
  end
end
