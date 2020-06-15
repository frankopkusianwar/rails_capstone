class User < ApplicationRecord
  validates :username, presence: true
  validates :fullname, presence: true
  has_many :opinions
end
