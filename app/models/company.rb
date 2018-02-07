class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  # def self.average_level_of_interest
  #   self.all.map do |company|
  #     [company.name, company.jobs.average(:level_of_interest)]
  #   end.to_h.invert.sort.reverse.to_h
  # end

  def self.average_level_of_interest
    Company.select('companies.id, companies.name, avg(jobs.level_of_interest)')
           .joins(:jobs)
           .group('companies.id')
           .order('avg(jobs.level_of_interest) desc')
  end
end
