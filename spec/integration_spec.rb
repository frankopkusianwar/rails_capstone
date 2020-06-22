require 'rails_helper'
RSpec.describe 'Testing the authentication', type: :system do
  user = FactoryBot.build(:user)
  opinion = FactoryBot.build(:opinion)
​
  feature 'Sign up authentication' do
    scenario 'Sign Up using valid params' do
      visit root_path
      click_on 'SignUp'
      fill_in 'fullname', with: user.fullname
      fill_in 'username', with: user.username
      click_on 'Create Acccount'
      expect(page).to have_content('Recent Opinions')
    end
​
    scenario 'Sign up using invalid fields' do
      visit root_path
      click_on 'SignUp'
      click_on 'Create Acccount'
      expect(page).to have_content("Username can't be blank")
    end
  end
​
  feature 'login authentication system' do
    scenario 'login with valid params' do
      visit root_path
      fill_in 'username', with: user.username
      click_on 'Submit'
      expect(page).to have_content('Recent Opinions')
    end
​
    scenario 'login using invalid username' do
      visit root_path
      fill_in 'username', with: 'inv'
      click_on 'Submit'
      expect(page).to have_content('invalid username.')
    end
  end
​
  feature 'Opinion Creation' do
    scenario 'create with valid parameters' do
      visit root_path
      fill_in 'username', with: user.username
      click_on 'Submit'
      expect(page).to have_content('Recent Opinions')
      fill_in 'opinion_Text', with: opinion.Text
      click_on 'Submit'
      expect(Opinion.find_by(Text: opinion.Text)).to be_an(Opinion)
    end
​
    scenario 'create opinion with invalid parameters' do
      visit root_path
      fill_in 'username', with: user.username
      click_on 'Submit'
      expect(page).to have_content('Recent Opinions')
      fill_in 'opinion_Text', with: ' '
      click_on 'Submit'
      expect(Opinion.find_by(Text: opinion.Text)).to be_an(Opinion)
    end
​
    scenario 'view user opinions' do
      visit root_path
      fill_in 'username', with: user.username
      click_on 'Submit'
      expect(page).to have_content('Recent Opinions')
      fill_in 'opinion_Text', with: opinion.Text
      click_on 'Submit'
      expect(Opinion.find_by(Text: opinion.Text)).to be_an(Opinion)
      click_on 'Home'
      expect(page).to have_content(opinion.Text)
    end
  end
​
  feature 'following a user' do
    user2 = FactoryBot.create(:user)
    scenario 'Follow user' do
      visit root_path
      fill_in 'username', with: user.username
      click_on 'Submit'
      expect(page).to have_content(user2.fullname)
      click_on user2.fullname
      click_on 'Follow'
      expect(page).to have_content('Unfollow')
    end
  end
  feature 'unfollowing a user' do
    user3 = FactoryBot.create(:user)
    scenario 'Unfollow user' do
      visit root_path
      fill_in 'username', with: user.username
      click_on 'Submit'
      expect(page).to have_content(user3.fullname)
      click_on user3.fullname
      click_on 'Follow'
      click_on 'Unfollow'
      expect(page).to have_content('Follow')
    end
  end
end
