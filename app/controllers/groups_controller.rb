class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.user_groups.create(user: current_user)
      redirect_to @group, notice: 'Adicionado com sucesso'
    else
      flash[:alert] = 'Não pode ser enviada'
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def invite
    
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
