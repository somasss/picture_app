class PostMailer < ApplicationMailer
  def post_mail(feed)
    @feed = feed
    @user = User.find(@feed.user_id)
    mail to: @user.email, subject: "投稿の確認メール"
  end
end
