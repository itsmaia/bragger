class ImmersionSubentry < ApplicationRecord
  enum immersion_type: { active: 0, passive: 1 }

  validates :duration, presence: true
  belongs_to :entry
end
