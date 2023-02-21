class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venue = matching_venues.order(:created_at)

    render({ :template => "venue_templates/index.html.erb" })
  end

  def show
    venueid = params.fetch("an_id")
    matching_venues = Venue.where({ :id => venueid })
    @the_venue = matching_venues.at(0)

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    venue = Venue.new
    venue.id = params.fetch("venue_id")
   # matching_venues = Venue.where({ :id => venue_id })
    #the_venue = matching_venues
    #the_venue.address = params.fetch("query_address")
    #the_venue.name = params.fetch("query_name")
    #the_venue.neighborhood = params.fetch("query_neighborhood")
    #the_venue.save
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save

    #redirect_to("/venues/#{the_venue.id}")
    redirect_to("/venues/#{venue.id}")

  end
  
  def update
    the_id = params.fetch("the_id")
    venue_matching = Venue.where({ :id => the_id })
    venue = venue_matching.at(0)
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save
    
    redirect_to("/venues/#{venue.id}")
  end

  def destroy
    the_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues
    venue.destroy

    redirect_to("/venues")
  end

end
