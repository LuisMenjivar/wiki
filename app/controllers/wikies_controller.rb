class WikiesController < ApplicationController
  before_action :set_wiky, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @wikies = Wiky.all
    authorize @wikies
    respond_with(@wikies)
  end

  def show
    respond_with(@wiky)
    authorize @wiky
  end

  def new
    @wiky = Wiky.new
    authorize @wiky
    respond_with(@wiky)
  end

  def edit
    @wiky = Wiky.find(params[:id])
    authorize @wiky
  end

  def create
    @wiky = Wiky.new(wiky_params)
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
      params.require(:wiky).permit(:title, :body, :user_id)
    end
end
