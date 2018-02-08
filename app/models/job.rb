class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments
  scope :sort_by_location, -> {order(:city)}
  scope :group_by_LOI, -> {order('level_of_interest DESC').group(:level_of_interest).count}

  #def self.sort_by_location(city = nil)
  #  if city.nil?
  #    self.order(:city)
  #  else
  #    self.where(city: city)
  #end
end
