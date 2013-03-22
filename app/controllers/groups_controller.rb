class GroupsController < ApplicationController
  before_filter :find_membership

  # def index
  #   @groups = Group.find(@membership.group_id)
  # end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])

    if @group.save
      @membership = Membership.create(user_id: current_user.id, group_id: @group.id)
      redirect_to dashboard_path, :notice => "Your group has been created."
    else
      flash[:alert] = "Group has not been created."
      render "new"
    end
  end

  private

  def find_membership
    @membership = Membership.where(user_id: current_user.id)
  end
end
