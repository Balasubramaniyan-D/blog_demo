class Blogpost < ApplicationRecord
    validates :title, :body, :category, presence: true
    has_many :comments, dependent: :destroy
    belongs_to :user
end
