class ListProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list_products, only: [:index, :show, :update, :destroy]
  before_action :set_list_product, only: [:show, :update, :destroy]

  def index
  end

  def show
  end

  def create
    return save_all(params['_json']) if params['_json'].is_a?(Array)

    @list_product = ListProduct.find_or_initialize_by(list_product_params)

    respond_to do |format|
      if @list_product.save
        format.json { render :show, status: :created, location: @list_product }
      else
        format.json { render json: @list_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list_product.update(list_product_params)
        format.json { render :show, status: :ok, location: @list_product }
      else
        format.json { render json: @list_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list_product.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def save_all(list)
    list.each do |p|
      instance = ListProduct.find_or_initialize_by(id: p['id'])
      instance.update(p.permit('list_id', 'product_id', 'ok'))
    end
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def set_list_products
    @list_products = current_user.list_products
  end

  def set_list_product
    @list_product = @list_products.find(params[:id])
  end

  def list_product_params
    params.require(:list_product).permit(:list_id, :product_id, :ok)
  end
end
