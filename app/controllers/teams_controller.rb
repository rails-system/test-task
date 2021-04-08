class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      current_user.team_id = @team.id
      current_user.save
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
    @team = Team.find_by(id: params[:id])
  end

  def add_member
    @user = User.find(params[:user_id])
    @user.team_id = params[:id]
    @user.save
    @team = Team.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def remove_member
    user = User.find_by(id: params[:id])
    @team = user.team
    user.team_id = nil
    user.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    team = Team.find_by(id: params[:id])
    team&.destroy
    redirect_to root_path
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
