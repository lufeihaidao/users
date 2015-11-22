class Article < ActiveRecord::Base

  belongs_to :user
  validates :title, presence: true, length: {minimum: 2, maxmum: 140}
  validates :user, presence: true
  validates :content, presence: true

  def self.top_article
    order(top_touched_at: :desc).first
  end
end
