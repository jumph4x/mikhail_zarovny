class Admin::ImagesController < ApplicationController
  layout 'admin'
  http_basic_authenticate_with name: "mzarovny", password: "gopagopa"
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  def index
    @q = Image.search(params[:q])
    @images = @q.result(distinct: true)
  end

  # GET /images/1
  def show
    redirect_to edit_admin_image_path(params[:id])
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to admin_image_path(@image, notice: 'Image was successfully created.') }
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to admin_image_path(@image, notice: 'Image was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to admin_images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:title, :year, :discipline, :subject_matter, :dimensions, :keywords, :description, :upload)
    end
end
