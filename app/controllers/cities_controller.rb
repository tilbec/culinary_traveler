class CitiesController < ApplicationController

  def address_to_geo(address)
    require 'open-uri'
    url = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + URI.encode(address)
    parsed_data = JSON.parse(open(url).read)
    lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
    lng = parsed_data["results"][0]["geometry"]["location"]["lng"]
    return [lat,lng]
  end

  def index
    @q = City.ransack(params[:q])
    @cities = @q.result(:distinct => true).includes(:recipes, :follows, :country).page(params[:page]).per(10)
    @follows = Follow.where(:user_id => current_user.id).pluck(:city_id)
    @places = City.all
    render("cities/index.html.erb")
  end

  def show
    @follow = Follow.new
    @recipe = Recipe.new
    @city = City.find(params[:id])

    render("cities/show.html.erb")
  end

  def new
    @city = City.new

    render("cities/new.html.erb")
  end

  def create
    @city = City.new

    @city.country_id = params[:country_id]
    @city.image = params[:image]
    @city.description = params[:description]
    @city.name = params[:name]

    address = params[:name]+ "," + @city.country.name
    latlng = address_to_geo(address)
    @city.lat = latlng[0]
    @city.lng = latlng[1]

    save_status = @city.save

    if save_status == true
        f = Follow.new
        f.user_id = current_user.id
        f.city_id = @city.id
        f.save

      referer = URI(request.referer).path

      case referer
      when "/cities/new", "/create_city"
        redirect_to("/cities")
      else
        redirect_back(:fallback_location => "/", :notice => "City created successfully.")
      end
    else
      render("cities/new.html.erb")
    end
  end

  def edit
    @city = City.find(params[:id])

    render("cities/edit.html.erb")
  end

  def update
    @city = City.find(params[:id])

    @city.country_id = params[:country_id]
    @city.image = params[:image]
    @city.description = params[:description]

    save_status = @city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cities/#{@city.id}/edit", "/update_city"
        redirect_to("/cities/#{@city.id}", :notice => "City updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "City updated successfully.")
      end
    else
      render("cities/edit.html.erb")
    end
  end

  def destroy
    @city = City.find(params[:id])

    @city.destroy

    if URI(request.referer).path == "/cities/#{@city.id}"
      redirect_to("/", :notice => "City deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "City deleted.")
    end
  end
end
