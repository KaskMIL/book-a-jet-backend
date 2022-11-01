class Api::V1::JetsController < ApplicationController
  def index
    jets = Jet.includes(:reservations).all.order(:id)
    if jets
      render json: jets
    else
      render json: { error: 'No jets found' }
    end
  end

  def show
    jet = Jet.find_by(id: params[:id])
    if jet
      render json: jet
    else
      render json: { error: 'No jet found' }
    end
  end

  def create
    image = Cloudinary::Uploader.upload(params[:image])
    jet = Jet.new(name: params[:name],
                  category: params[:category],
                  description: params[:description],
                  price_per_day: params[:pricePerDay],
                  finance_fee: params[:financeFee],
                  size: params[:size], image: image['url'])
    if jet.save
      render json: { jet:, message: 'Jet created successfully' }, status: :ok
    else
      render json: { error: 'Unable to create jet' }, status: :unprocessable_entity
    end
  end

  def destroy
    jet = Jet.find_by(id: params[:id])
    if jet
      jet.destroy
      render json: { message: 'Jet deleted successfully' }, status: :ok
    else
      render json: { error: 'Unable to delete jet' }, status: :unprocessable_entity
    end
  end

  def update
    jet = Jet.find_by(id: params[:id])
    if jet
      jet.update(jet_params)
      render json: { message: 'Jet updated successfully' }
    else
      render json: { error: 'Unable to update jet' }
    end
  end

  private

  def jet_params
    params.require(:jet).permit(:name, :price_per_day, :description, :size, :category, :finance_fee, :image)
  end
end
