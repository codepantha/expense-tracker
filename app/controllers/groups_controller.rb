class GroupsController < ApplicationController
  before_action :set_group, only: [:show]
  def index
    @groups = current_user.groups
  end

  def show; end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to groups_path, notice: "#{@group.name} added successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:user_id, :name, :icon)
  end
end
