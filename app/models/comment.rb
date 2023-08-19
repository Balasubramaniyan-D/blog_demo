class Comment < ApplicationRecord
  validates :body, :email, presence: true
  belongs_to :blogpost
end
