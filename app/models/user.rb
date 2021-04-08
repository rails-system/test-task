class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :team, optional: true
  has_many :shifts

  after_create :initialize_shift

  def name
    "#{first_name} #{last_name}"
  end

  def initialize_shift
    (1..7).each do |day|
      self.shifts.find_or_create_by(day: day)
    end
  end
end
