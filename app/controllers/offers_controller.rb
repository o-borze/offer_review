class OffersController < ApplicationController
  def index
    @offers = Offer.all
    render json: @projects, include: :attributes, status: :ok
  end
  
  def show
    @offer = Offer.find(params[:id])
    render json: @offer, include: :attributes, status: :ok
  end
  
  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      render json: @offer, include: :attributes, status: :created
    else
      render nothing: true, status: :unprocessable_entity
    end
  end
  
  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      render json: @offer, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
    head :no_content
  end
  
  def offer_params
    params.require(:offer).permit()
  end
end
