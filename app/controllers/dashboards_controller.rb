class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_membership

  def show

  end

  private

  def find_membership
    @membership = Membership.where(user_id: current_user.id)
  end
end
