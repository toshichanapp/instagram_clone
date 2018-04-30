class PicturesController < ApplicationController
  
  before_action :redirect_non_login_user, only: %i[show new edit]
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  
  def index
    @pictures = Picture.all
  end
  
  def show; end
  
  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end
  
  def confirm
    @picture = Picture.new(picture_params)
    render :new if @picture.invalid?
  end
  
  def create
    @picture = Picture.new(picture_params)
    if params[:picture][:image].present?
      @picture.image.retrieve_from_cache! params[:picture][:image]
    end
    if @picture.save
      PictureMailer.create_mail(@picture).deliver
      redirect_to pictures_url, notice: 'pictureを作成しました！'
    else
      render 'new'
    end
  end
  
  def edit; end
  
  def update
    if @picture.update(picture_params)
      redirect_to pictures_url, notice: 'pictureを編集しました！'
    else
      render 'edit'
    end
  end
  
  def destroy
    @picture.destroy
    redirect_to pictures_url, notice: 'pictureを削除しました！'
  end
  
  private
  
  def picture_params
    params.require(:picture).permit(:user_id, :image, :description)
  end
  
  def set_picture
    @picture = Picture.find(params[:id])
  end
  
end
