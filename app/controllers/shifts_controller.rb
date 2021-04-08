class ShiftsController < ApplicationController
  def index
  end

  def update
    @shift = Shift.find_by(id: params[:id])
    @user = @shift.user
    @shift.update(shift_params)
    respond_to do |format|
      format.js
    end
  end

  def get_users
    @team = Team.find_by(id: params[:team_id])
    @users = @team.users
    respond_to do |format|
      format.js
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:from, :to)
  end
end
