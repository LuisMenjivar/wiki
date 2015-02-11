class WikiesController < ApplicationController
  before_action :set_wiky, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @allowed_collaborations = allowed_collaborations(current_user)
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
    @user_ids_array = @wiky.collaborations.pluck(:user_id)
    # @wiky = Wiky.find(params[:id])
    # set_wiky
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

  def  allowed_collaborations(user)
    @wiky1 = []
    Wiky.all.each { |wiky|wiky.collaborations.where(
    user_id: user.id).pluck(:wiky_id).each {
    |id| @wiky1 << Wiky.find(id)}}
    return @wiky1
  end
end
