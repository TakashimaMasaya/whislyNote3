class WhiskyUser < ApplicationRecord
  belongs_to :whisky
  belongs_to :user
end
