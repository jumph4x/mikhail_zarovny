class ImagesController < ApplicationController
  before_filter :prime_params
  helper_method :image_params, :html_title

  # GET /images
  def index
    @q = Image.search(ransack_query)
    @images = @q.result(distinct: true)
  end

  def image_params
    params.permit(:year, :discipline, :subject_matter)
  end

  def html_title
    if collection_name.present? 
      "#{collection_name} by Mikhail Zarovny"
    else
      "Mikhail Zarovny's Art"
    end
  end

  def collection_name
    [:subject_matter, :discipline, :year].map{|t| collection_value(t, params[t]) }.join(' ')
  end

  private

  def prime_params
    return unless image_params.empty?
    params[:year] = '2010-present'
    params[:subject_matter] = 'landscape'
    params[:discipline] = 'painting'
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
