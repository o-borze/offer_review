class OffersController < ApplicationController
  def index
    @offers = Offer.all
    render json: @projects, include: :products, status: :ok
  end
  
  def show
    @offer = Offer.find(params[:id])
    render json: @offer, include: :products, status: :ok
  end
  
  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      render json: @offer, include: :products, status: :created
    else
      render nothing: true, status: :unprocessable_entity
    end
  end
  
  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params.dig(:offer, :state))
      render json: @offer, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
    head :no_content
  end
  
  def offer_params
    params.require(:offer).permit(:state, products: [:quantity, :type, product_attributes: [:key, :value, :type]])
  end
end
