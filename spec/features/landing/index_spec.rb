# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'landing page' do
  before :each do
    
    
    
    visit '/'
  end
  
  it 'displays application title' do
    user_1 = User.create!(name: 'Kevdog', email: 'shrimpKev@gmail.com', password: 'pass112')
    user_2 = User.create!(name: 'Shpoinkle', email: 'Shpoink@gmail.com', password: 'passgfga')
    expect(page).to have_content('Viewing Party')
  end

  it 'has button to create new user' do
    user_1 = User.create!(name: 'Kevdog', email: 'lesserKev@gmail.com', password: 'pass112')
    user_2 = User.create!(name: 'Shpoinkle', email: 'Shpeoink@gmail.com', password: 'passgfga')
   
    expect(page).to have_button('Create New User')
  end

  it 'displays existing users with links to users dashboard' do
    user_1 = User.create!(name: 'Kevdog', email: 'greaterKev@gmail.com', password: 'pass112')
    user_2 = User.create!(name: 'Shpoinkle', email: 'Shpasdoink@gmail.com', password: 'passgfga')
   
    click_link "Log In"
    expect(current_path).to eq(login_path)

    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password

    click_on "Log In"

    visit '/'

    expect(page).to have_content(user_1.email)

    # click_link "Log In"
    # expect(current_path).to eq(login_path)

    # fill_in :email, with: @user_2.email
    # fill_in :password, with: @user_2.password

    # click_on "Log In"

    # visit '/'

    # expect(page).to have_link(@user_2.name)

    # click_link(@user_1.name)
    # expect(current_path).to eq("/users/#{@user_1.id}")
  end

  it 'displays link to return to landing page' do
    user_1 = User.create!(name: 'Kevdog', email: 'grandKev@gmail.com', password: 'pass112')
    user_2 = User.create!(name: 'Shpoinkle', email: 'Shpoadsfaink@gmail.com', password: 'passgfga')
   
    expect(page).to have_link('Return Home')

    click_link('Return Home')

    expect(current_path).to eq('/')
  end

  it 'displays login link' do 
    user_1 = User.create!(name: 'Kevdog', email: 'killerKev@gmail.com', password: 'pass112')
    user_2 = User.create!(name: 'Shpoinkle', email: 'Shpoadsfagink@gmail.com', password: 'passgfga')
   
    expect(page).to have_link("Log In", href: login_path)

    click_link "Log In"
    expect(current_path).to eq(login_path)
  end

  it 'displays log out link and not log in link when user is logged in' do 
    user_1 = User.create!(name: 'Kevdog', email: 'lagerKev@gmail.com', password: 'pass112')
    user_2 = User.create!(name: 'Shpoinkle', email: 'Shpoiggggggnk@gmail.com', password: 'passgfga')
   

    click_link "Log In"
    expect(current_path).to eq(login_path)

    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password

    click_on "Log In"

    visit '/'
    expect(page).to_not have_link("Log In")
    expect(page).to have_link("Log Out")
  end 

  it "can log out a user successfully" do 
    user_1 = User.create!(name: 'Kevdog', email: 'angryKev@gmail.com', password: 'pass112')
    user_2 = User.create!(name: 'Shpoinkle', email: 'Shpoinadsfk@gmail.com', password: 'passgfga')
   
    click_link "Log In"
    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password
    click_on "Log In"

    visit '/'

    click_link "Log Out"

    expect(current_path).to eq(root_path)
  end
end
