class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  def index
    @q = Image.search(params[:q])
    @images = @q.result(distinct: true)
  end

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end
end
