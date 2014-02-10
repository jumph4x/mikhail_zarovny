class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  helper_method :image_params

  # GET /images
  def index
    @q = Image.search(ransack_query)
    @images = @q.result(distinct: true)
  end

  def image_params
    params.permit(:year, :discipline, :subject_matter)
  end

  private

  def ransack_query
    hash = {}

    image_params.each do |k, v|
      next unless v.present?
      hash["#{k}_eq"] = collection_value(k, v)
    end

    hash[:year_eq] = '2010-Present' if image_params.empty?
    hash
  end
end
