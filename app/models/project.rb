class Project < ActiveRecord::Base
  has_many :shots, dependent: :delete_all
  validates :name, presence: true
end
