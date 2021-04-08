module ApplicationHelper

  def user_list
    User.all
  end

  def team_list
    Team.all
  end
end
