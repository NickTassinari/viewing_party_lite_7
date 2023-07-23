require 'rails_helper'

RSpec.describe 'User Show Page' do
  describe 'user dash' do
    before(:each) do
      @user1 = User.create!(name: 'Kevdog', email: 'SmallerKev@gmail.com', password: 'pass112')
      @party1 = ViewingParty.create!(duration: 120, date: '05-03-2024', time: '03:00:00', movie_id: 1)
      @viewing_party_user1 = ViewingPartyUser.create!(user_id: @user1.id, viewing_party_id: @party1.id)
      visit '/'

      click_link "Log In"
      fill_in :email, with: @user1.email
      fill_in :password, with: @user1.password

      click_on "Log In"
      visit "/users/#{@user1.id}"
    end

    it "has user's name Dash at top of page" do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
    end

    it 'has Button to Discover Movies' do
      expect(page).to have_button('Discover Movies')
    end

    it 'has section that lists viewing parties' do
      
      within('#viewing-parties') do
        expect(page).to have_content('Viewing Parties')
        expect(page).to have_content(@party1.id)
      end
    end
  end

  describe 'authentication' do
    it "user cannot access show page without logging in first" do 
      user1 = User.create!(name: 'Kevdog', email: 'bbKev@gmail.com', password: 'pass112')
      
      visit user_path(user1)
      expect(current_path).to eq('/')

      expect(page).to have_content("Log in to view this page")

      click_link "Log In"
      fill_in :email, with: user1.email
      fill_in :password, with: user1.password

      click_on "Log In"

      visit user_path(user1)
      expect(current_path).to eq(user_path(user1))
    end 
  end
end
