class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :lists
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #after_create :send_hello_email

  private

  def send_hello_email
    UserMailer.with(user: self).hello.deliver_now
  end
end
