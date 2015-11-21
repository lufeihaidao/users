class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: {minimum: 2, maxmum: 10}
  validates :admin, inclusion: {in: [true, false]}

  def self.add email
    self.new email: email, password: email, password_confirmation: email
  end
end
