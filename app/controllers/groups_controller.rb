class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:user_id, :name, :icon)
  end
end
