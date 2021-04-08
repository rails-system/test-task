class NotificationMailer < ApplicationMailer

  def shift_added(shift)
    @shift = shift
    @user = shift&.user
    @team = @user.team
    mail to: ENV['DEFAULT_EMAIL'], subject: 'Shift Added'
  end
end