class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shares, only: [:index, :destroy]
  before_action :set_share, only: [:destroy]

  def index
  end

  def create
    return save_all(params['_json']) if params['_json'].is_a?(Array)

    @share = Share.find_or_initialize_by(share_params)

    respond_to do |format|
      if @share.save
        format.json { render :show, status: :created, location: @share }
      else
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @share.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def save_all(shares)
    shares.each do |p|
      instance = Share.find_or_initialize_by(id: p['id'])
      param = params.permit('list_id', 'created_at').tap do |i|
        i[:user] = user
        i[:by] = current_user
      end
      instance.update(param)
    end
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def set_shares
    @shares = current_user.shares
  end

  def set_share
    @share = @shares.find(params[:id])
  end

  def share_params
    user = User.find_by(email: params[:email])
    params.permit(:list_id, :created_at).tap do |p| 
      p[:user] = user
      p[:by] = current_user
    end
  end
end
