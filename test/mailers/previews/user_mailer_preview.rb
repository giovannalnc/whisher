# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/hello
  def hello
    user = User.first
    UserMailer.with(user: user).hello
  end

  def decrease_price
    user = User.first
    UserMailer.with(user: user).decrease_price
  end
end
