class GroupsController < ApplicationController
  # before_filter :find_membership

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])

    if @group.save
      @membership = Membership.new(user_id: current_user.id, group_id: @group.id)
      redirect_to dashboard_path, :notice => "Group has been created."
    else
      flash[:alert] = "Group has not been created."
      render "new"
    end
  end

  private

  # def find_membership
  #   @membership = Membership.find_or_create_by_guest_id_and_user_id(guest_id: guest_id, user_id: food_id)
  # end
end
