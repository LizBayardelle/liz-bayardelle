class Blog < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable
  has_many :comments
  # after_create :send_email
  #
  #
  # def send_email
  #   User.where(opt_in: true).each do |user|
  #     BlogMailer.new_blog(self, user).deliver_now
  #   end
  # end
end
