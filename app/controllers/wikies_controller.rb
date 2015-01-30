class WikiesController < ApplicationController
  before_action :set_wiky, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @wikies = Wiky.public_wikys
    authorize @wikies
    if (current_user.premium? || current_user.admin?)
      @private = current_user.wikys.private_wikys
      authorize @private
    end
  end

  def show
    respond_with(@wiky)
    authorize @wiky
  end

  def new
    @wiky = current_user.wikys.new
    authorize @wiky
    respond_with(@wiky)
  end

  def edit
    @wiky = Wiky.find(params[:id])
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
