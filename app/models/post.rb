class Post < ActiveRecord::Base

  belongs_to :user
  validates :title, :post_text, presence: true
end
