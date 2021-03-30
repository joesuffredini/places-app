class Api::PlacesController < ApplicationController

  def index
    @place = Place.all
    render "index.json.jb"
  end

  def show
    @place = Place.find(params[:id])
    render "show.json.jb"
  end
  
  def create
    @place = Place.new({
      id: params[:id],
      name: params[:name],
      address: params[:address],
     })
     if @place.save
      render "show.json.jb"
    else
      render json: { errors: @place.errors.full_messages }, status:406
    end
  end

  def update
    input = params[:id]
    @place = Place.find_by(id: input)
    @place.name = params[:name] || @place.name
    @place.address = params[:address] || @place.address
    
    if @place.save
      render "show.json.jb"
    else
      render json: { errors: @place.errors.full_messages }, status:406
    end
  end

  def destroy
    input = params[:id]
    place = Place.find_by(id: input)
    place.destroy
    render json: { message: "This item succesfully destroyed" }
  end


end
