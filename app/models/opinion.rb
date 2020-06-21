class Opinion < ApplicationRecord
  validates :Text, presence: true
  belongs_to :user
  has_many :comments
  default_scope { order("created_at DESC") }
end
