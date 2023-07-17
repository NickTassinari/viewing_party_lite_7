require 'rails_helper'

RSpec.describe 'Loggin In' do
  it "can log in with valid credentials" do 
    user = User.create(name: "Squonky", email: "dasquonkster42@yahoo.biz", password: "kelp chips")

    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))
  end

  it "can handle incorrect credentials" do 
    user = User.create(name: "Squonky", email: "dasquonkster42@yahoo.biz", password: "kelp chips")

    visit root_path

    click_on "Log In"

    fill_in :email, with: user.email 
    fill_in :password, with: "mint choco chimp"

    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Oops username or password is wrong, nice try lil chump")
  end
  
end