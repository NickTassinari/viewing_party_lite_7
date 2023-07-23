require 'rails_helper'

RSpec.describe '/register', type: :feature do
  describe 'new user creation' do
    before(:each) do
      visit '/register'
    end

    it 'form to register has a descriptive header' do
      expect(page).to have_content('Register a New User')
      expect(page).to have_content('Name:')
      expect(page).to have_content('Email:')
    end

    it 'has a form to register' do
      expect(page).to have_field('Name:')
      expect(page).to have_field('Email:')
      expect(page).to have_field('Password:')
      expect(page).to have_field('Password Confirmation:')
      expect(page).to have_button('Register')

    end

    xit 'form can be filled out' do
      fill_in('Name:', with: 'John Jacob Jingleheimer Schmidt')
      fill_in('Email:', with: 'jjjs@gmail.com')
      fill_in('Password:', with: 'password1234')
      fill_in('Password Confirmation:', with: 'password1234')

      click_button 'Register'
      
      expect(current_path).to_not eq('/register')
      expect(page).to have_content("John Jacob Jingleheimer Schmidt's Dashboard") 
    end

    it 'if email validation fails, try again' do
      user1 = create(:user, email: "Johnny49@gmail.com")
      fill_in('Name:', with: 'John Jacob Jingleheimer Schmidt')
      fill_in('Email:', with: "Johnny49@gmail.com")
      click_button 'Register'
      expect(current_path).to eq("/register")
      expect(page).to have_content('Email already exists')
    end
  end
end
# sad path: field isn't filled in
