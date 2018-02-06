class Contact < ApplicationRecord
  validates :name, :title, :email, presence: true
  belongs_to :company
end
