class ProductsController < ApplicationController
  before_action :authorize_request
  before_action :find_product, only: [:show, :update, :destroy]

  def show
    if @product
      render json: @product.as_json(include: :images).merge(
        images: @product.images.map do |image|
          url_for(image)
        end
      )
    else
      render json: { error: 'Product not found' }, status: :not_found
    end
  end

  def create
    @product = @current_user.products.build(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :rating, :address, images: [])
  end

  def find_product
    @product = @current_user.products.find_by(id: params[:id])
  end
end
