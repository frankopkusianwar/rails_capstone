class Opinion < ApplicationRecord
  validates :Text, presence: true
  belongs_to :user
  has_many :comments
end
