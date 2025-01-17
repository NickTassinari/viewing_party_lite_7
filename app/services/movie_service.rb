class MovieService 
  
  def top_movies
    get_url('movie/top_rated')
  end

  def search_movies(search)
    get_url("search/movie?query=#{search}")    
  end

  def find_movie(id)
    get_url("movie/#{id}")
  end

  def movie_reviews(movie_id)
    get_url("movie/#{movie_id}/reviews")[:results]
  end

  def movie_cast(movie_id)
    get_url("movie/#{movie_id}/credits")[:cast]
  end

  def conn 
    Faraday.new(url: 'https://api.themoviedb.org/3/') do |faraday|
      faraday.headers['Authorization'] = ENV['TMDB_AUTH']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end