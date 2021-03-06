class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
  end

  def create
    return save_all(params['_json']) if params['_json'].is_a?(Array)

    @product = Product.find_or_initialize_by(product_params)

    respond_to do |format|
      if @product.save
        format.json { render :show, status: :created, location: @product }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.json { render :show, status: :ok, location: @product }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def save_all(products)
    products.each do |p|
      instance = Product.find_or_initialize_by(id: p['id'])
      instance.update(p.permit('name'))
    end
    respond_to do |format|
      format.json { head :no_content }
    end
  end
  
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :name)
  end
end
