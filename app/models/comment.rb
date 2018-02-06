class Comment < ApplicationRecord
  validates :author, :body, presence: true
  belongs_to :job
end
