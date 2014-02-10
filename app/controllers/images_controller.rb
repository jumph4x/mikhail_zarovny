class ImagesController < ApplicationController
  before_filter :prime_params
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

  def prime_params
    return if image_params.present?
    params[:year] = '2010-Present'
    params[:subject_matter] = 'Landscape'
    params[:discipline] = 'Painting'
  end

  def ransack_query
    hash = {}

    image_params.each do |k, v|
      next unless v.present?
      hash["#{k}_eq"] = collection_value(k, v)
    end

    hash
  end
end
