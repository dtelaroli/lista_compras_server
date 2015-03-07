class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shares, only: [:index, :destroy]
  before_action :set_share, only: [:destroy]

  def index
  end

  def create
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

  def set_shares
    @shares = current_user.shares
  end

  def set_share
    @share = @shares.find(params[:id])
  end

  def share_params
    user = User.find_by(email: params[:email])
    params.permit(:list_id, :created_at).tap {|p| p[:user] = user}
  end
end
