class WikiesController < ApplicationController
  before_action :set_wiky, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @wikies = Wiky.all
    respond_with(@wikies)
  end

  def show
    respond_with(@wiky)
  end

  def new
    @wiky = Wiky.new
    respond_with(@wiky)
  end

  def edit
  end

  def create
    @wiky = Wiky.new(wiky_params)
    @wiky.save
    respond_with(@wiky)
  end

  def update
    @wiky.update(wiky_params)
    respond_with(@wiky)
  end

  def destroy
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
