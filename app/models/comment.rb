class Comment < ApplicationRecord
  validates :authorname, :body, presence: true
  belongs_to :job
end
