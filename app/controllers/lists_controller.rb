class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lists, only: [:index, :show, :update, :destroy]
  before_action :set_list, only: [:show, :update, :destroy]

  def index
  end

  def show
  end

  def create
    @list = List.find_or_initialize_by(list_params)

    respond_to do |format|
      if @list.save
        format.json { render :show, status: :created, location: @list }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.json { render :show, status: :ok, location: @list }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_lists
    @lists = current_user.lists
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = @lists.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:id, :user_id, :name, :archived, :created_at).tap {|l| l[:user] = current_user }
  end
end
