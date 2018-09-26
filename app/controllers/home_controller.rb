class HomeController < ApplicationController
  def index
  end

  def guidelines
  end

  def location_search_get
  end

  def location_search
  	# location = params[:location]
  	if params[:search] # for search form
			@complaints = Complaint.search(params[:search])
		else
			@complaints = {}
		end
		@location = params[:search]
  end

end
