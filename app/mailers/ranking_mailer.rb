class RankingMailer < ActionMailer::Base
  default from: 'swipey-rank@squareup.com'

  def user_rank(user_id)
    @user = User.find(user_id)
    email = @user.username + '@squareup.com'

    mail to: email,
         subject: 'Thanks for playing SwipeyBird!'
  end
end
