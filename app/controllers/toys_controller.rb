class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create(toy_params)
    if toy
      render json: toy, status: :updated
    else
      error_not_found
    end
  end

  def update
    toy = Toy.find_by(id: params[:id])
    if toy
      toy.update(toy_params)
      render json: toy
    else
      error_not_found
    end
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    if toy
      toy.destroy
      head :no_content
    else
      error_not_found
    end
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

  def error_not_found
    render json: {error: "toy not found"}, status: :not_found
  end
  

end
