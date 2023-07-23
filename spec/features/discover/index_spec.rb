# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'Discover Movies Page', type: :feature do
#   before(:each) do
#     @user_1 = create(:user)
#     @user_2 = create(:user)
#     visit user_path(@user_1)
#   end

#   describe 'Discover Movies Button' do
#     it 'button to discover movies routes to user discover page' do
#       click_on 'Discover Movies'
#       expect(current_path).to eq(user_discover_index_path(@user_1))
#       expect(current_path).to eq("/users/#{@user_1.id}/discover")
#     end

#     it 'button to discover movies sad path' do
#       click_on 'Discover Movies'
#       expect(current_path).to_not eq(user_discover_index_path(@user_2))
#       expect(current_path).to_not eq("/users/#{@user_2.id}/discover")
#     end
#   end

#   describe 'button to discover top rated movies' do
#     it 'has button' do
#       visit user_discover_index_path(@user_2)
#       expect(page).to have_button('Discover Top Rated Movies')
#     end

#     it 'button has path' do
#       visit user_discover_index_path(@user_2)
#       click_on 'Discover Top Rated Movies'
#       expect(current_path).to eq(user_movies_path(@user_2))
#     end
#   end

#   describe 'search field for movies' do
#     before(:each) do
#       visit user_discover_index_path(@user_2)
#     end
#     it 'has a search field' do
#       expect(page).to have_field(:movie_search)
#     end

#     it 'has search button' do
#       expect(page).to have_button('Find Movies')
#     end

#     it 'movie search by title' do
#       fill_in :movie_search, with: 'Neverending'
#       click_button 'Find Movies'
#       expect(current_path).to eq(user_movies_path(@user_2))
#     end
#   end
# end
