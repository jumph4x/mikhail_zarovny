class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :collection, :collection_value
  before_filter :ensure_canonical_domain

  def collection_value type, value
    collection(type.to_s.upcase.constantize).each do |k,v|
      return k if v == value
    end

    nil
  end

  def collection obs, urls = true
    obs.map{|x| [x, (urls ? x.to_url : x)]}.unshift(['All', nil])
  end

  def ensure_canonical_domain
    return unless Rails.env.production?
    
    if request.host != 'mikhailzarovny.com'
      redirect_to 'http://mikhailzarovny.com', :status => :moved_permanently
    end
  end
end
