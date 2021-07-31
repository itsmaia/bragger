class ImmersionSubentry < ApplicationRecord
  enum immersion_type: { active: 0, passive: 1 }

  scope :active, -> { where(immersion_type: :active) }
  scope :passive, -> { where(immersion_type: :passive) }
  validates :duration, presence: true
  belongs_to :entry
end
