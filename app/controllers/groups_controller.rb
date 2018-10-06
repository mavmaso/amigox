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

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, notice: 'Apagado com sucesso'
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group, notice: 'Editado com sucesso'
    else
      flash[:alert] = 'Não pode ser enviada'
      render :new
    end
  end

  def invitation
    @group = Group.find(params[:id])
  end

  def invite
    user = User.find_by(email: params.require(:invite).permit(:email))
    user_group = @group.user_groups.create(user: user)
    if user_group.persisted?
      redirect_to @group, notice: 'Adicionado com sucesso'
    else
      flash[:alert] = 'Não pode ser enviada'
      render :invitation
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end
