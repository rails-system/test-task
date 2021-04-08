class Team < ApplicationRecord
  has_many :users, dependent: :nullify

  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false
end
