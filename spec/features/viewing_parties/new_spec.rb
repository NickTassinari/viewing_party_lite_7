# require 'rails_helper'

# RSpec.describe "New Viewing Party", type: :feature do 
#   before(:each) do 
#     @user = create(:user)
#     @user2 = create(:user)
#     @user3 = create(:user)
#     # movie_details = File.read("spec/fixtures/movie_details.rb")
#     # @movie = Movie.new(movie_details)
#     @movie = MovieFacade.new.movie(238)
#     visit "/users/#{@user.id}/movies/#{@movie.id}/viewing-party/new"
#   end

#   describe "Viewing Party" do 
#     it "shows the default value of the duration" do 
#       runtime = (find_field("duration").value)

#       expect(page).to have_field(:duration)
#       expect(find_field("duration").value).to eq("#{@movie.runtime}")
#       expect(runtime.to_i < @movie.runtime).to be(false)
#     end

#     it "has date and time fields" do 
#       expect(page).to have_field(:date)
#       expect(page).to have_field(:time)
#     end

#     it "has checkboxes next to each user in the system" do 
#       expect(page).to have_content("Host: #{@user.name}")
#       expect(page).to have_content(@user2.name)
#       expect(page).to have_content(@user3.name)
#     end

#     it "has button to create party" do 
#       expect(page).to have_button("Create Viewing Party")
#       click_button "Create Viewing Party"
#       expect(current_path).to eq(user_path(@user))
#     end
#   end
# end