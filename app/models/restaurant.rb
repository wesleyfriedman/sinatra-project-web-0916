class Restaurant < ActiveRecord::Base
  has_many :user_restaurants
  has_many :users, through: :user_restaurants


  def self.search(location:, term:)
    # binding.pry
    @results = Yelp.client.search(location, {term: term})
    # binding.pry
    @results.businesses.map do |b|
      @name = b.name
      @address = b.location.display_address.join(", ")
      @rating = b.rating
      Restaurant.create(name: @name, address: @address, rating: @rating)
    end
  end
end
