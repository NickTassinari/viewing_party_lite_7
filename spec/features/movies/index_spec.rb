# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movies results page' do
  before(:each) do
    @user_1 = create(:user)
  end

  describe 'visiting movies results page' do
    before(:each) do
      visit user_discover_index_path(@user_1)
    end

    it 'top movies button goes to results page', :vcr do
      click_on 'Discover Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user_1))
    end

    it 'movies results page lists top movies if top movies button clicked', :vcr do
      click_on 'Discover Top Rated Movies'
      expect(page).to have_css('.movies')

      within '.movies' do
        expect(page).to have_css('.movie', maximum: 20 )
      end

      within(first('.movie')) do
        expect(page).to have_css('.title')
        expect(page).to have_content('The Godfather')
        expect(page).to have_css('.vote-average')

        within('.vote-average') do 
          expect(page).to have_content('8.7')
        end
      end
    end

    it 'movies results page lists relevant movies if search button clicked', :vcr do
      fill_in(:movie_search, with: 'neverending')
      click_button 'Find Movies'
      expect(page).to have_css('.movies')
      within '.movies' do
        expect(page).to have_css('.movie', maximum: 20)
      end

      within(first('.movie')) do
        expect(page).to have_content('The NeverEnding Story')
        expect(page).to have_css('.title')
        expect(page).to have_css('.vote-average')

        within('.vote-average') do 
          expect(page).to have_content('7.192')
        end
      end

      
    end
  end

  describe 'movies results page content' do
    before(:each) do
      visit user_movies_path(@user_1)
    end

    xit 'title of movie is link to movie details page' do 
      within ".movies" do 
        within(first(".movie")) do 
          within ".title" do
            expect(page).to have_link('The Godfather', href: "/users/#{@user_1.id}/movies/238")
          end
        end
      end
    end

    xit 'has a button to return to Discover page' do
      expect(page).to have_button('Discover Page')
      click_button 'Discover Page'
      expect(current_path).to eq(user_discover_index_path(@user_1))
    end
  end
end
