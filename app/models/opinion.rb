class Opinion < ApplicationRecord
  validates :Text, presence: true
  belongs_to :user
end
