class User < ApplicationRecord
  validates :username, presence: true
  validates :fullname, presence: true
end
