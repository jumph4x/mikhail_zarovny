module ApplicationHelper

  def active type, value
    params[type] == value ? 'active' : ''
  end
end
