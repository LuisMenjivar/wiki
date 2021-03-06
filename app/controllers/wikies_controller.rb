class WikiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search_results]
  before_action :set_wiky, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def search_results
    @found_wikies = Wiky.search_for(params[:search_keywords])
  end

  def index
    if current_user
      @wikies_allowed_to_collaborate_on = current_user.collaborated_wikys
      if (current_user.premium? || current_user.admin?)
        @private = current_user.wikys.private_wikys
        authorize @private
      end
    end
    @wikies = Wiky.public_wikys
  end

  def show
    respond_with(@wiky)
  end

  def new
    @wiky = current_user.wikys.new
    authorize @wiky
    respond_with(@wiky)
  end

  def edit
    @collaborations = @wiky.collaborations
    authorize @wiky
  end

  def create
    @wiky = current_user.wikys.new(wiky_params)
    authorize @wiky
    @wiky.save
    respond_with(@wiky)
  end

  def update
    @wiky = Wiky.find(params[:id])
    authorize @wiky
    @wiky.update(wiky_params)
    respond_with(@wiky)
  end

  def destroy
    @wiky = Wiky.find(params[:id])
    authorize @wiky
    @wiky.destroy
    flash[:alert] = "Wiky deleted successfully"
    respond_with(@wiky)
  end

  private

  def set_wiky
    @wiky = Wiky.find(params[:id])
  end

  def wiky_params
    params.require(:wiky).permit(:title, :body, :user_id, :public)
  end
end
