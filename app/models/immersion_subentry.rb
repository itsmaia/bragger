class ImmersionSubentry < ApplicationRecord
  belongs_to :entry

  enum type: {
    active: 0,
    passive: 1
  }
end
