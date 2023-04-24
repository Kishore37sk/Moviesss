class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :reviews,dependent: :destroy

  # after_create :send_mail
  #
  # def send_mail
  #   SendEmailsToUsersJob.perform_now(self)
  # end

end

