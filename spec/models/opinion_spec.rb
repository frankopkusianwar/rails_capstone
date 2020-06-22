require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:Text) }
  end

  describe 'associations' do
    it { should have_many(:comments) }
    it { should belong_to(:user) }
  end
end
