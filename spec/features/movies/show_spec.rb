# require 'rails_helper'

# RSpec.describe 'Movie Detail Page', type: :feature do 
#   before(:each) do 
#     @user_1 = create(:user)
#     @movie = MovieFacade.new.movie(238)

#     visit user_movie_path(@user_1, @movie.id) 
#   end

#   describe 'movie details' do 
#     it 'displays title' do 
#       expect(page).to have_content("#{@movie.title}")
#     end

#     it 'displays vote average' do 
#       expect(page).to have_content("Vote Average:")
#       expect(page).to have_content(@movie.vote_average)
#     end

#     it 'displays runtime' do 
#       expect(page).to have_content("Run Time:")
#       expect(page).to have_content(@movie.runtime)
#     end
    
#     it 'displays genres' do
#       expect(page).to have_content("Genres:")
#       expect(page).to have_content(@movie.genres.first)
#     end

#     it 'displays summary' do 
#       expect(page).to have_content("Summary:") 
#       expect(page).to have_content(@movie.overview)
#     end
#   end

#   describe 'review details' do 
#     it 'has first 10 cast members' do 
#       expect(page).to have_css(".cast-member", count: 10)
#       within(".cast-members") do 
#         expect(page).to have_content("Cast Members:")
#         within(first(".cast-member")) do 
#           expect(page).to have_content("Marlon Brando")
#         end
#       end
#     end

#     it 'has reviews & count' do 
#       within(".reviews") do 
#         expect(page).to have_content("Reviews:")
#         expect(page).to have_content("Review Count:")
#         expect(page).to have_content('5')
#       end
#     end

#     it 'has each reviews author and information' do 
#       within(first(".review")) do 
#         expect(page).to have_content("futuretv")
#         expect(page).to have_content("Author:")
#         expect(page).to have_content("Summary:")
#         expect(page).to have_content("The Godfather Review by Al Carlson")
#       end
#     end
#   end

#   describe 'buttons' do
#     it 'has button to discover movies' do
#       expect(page).to have_button('Discover Page')
#       click_on 'Discover Page'
#       expect(current_path).to eq(user_discover_index_path(@user_1))
#     end

#     it 'has button to new viewing party page' do
#       expect(page).to have_button('New Viewing Party')
#       click_button('New Viewing Party')
#       expect(current_path).to eq("/users/#{@user_1.id}/movies/#{@movie.id}/viewing-party/new")
#     end
#   end
# end