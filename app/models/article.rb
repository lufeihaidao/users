class Article < ActiveRecord::Base

  validates :name, presence: true, length: {minimum: 2, maxmum: 10}
  validates :admin, inclusion: {in: [true, false]}

  def self.add email
    self.new email: email, password: email, password_confirmation: email
  end
end
