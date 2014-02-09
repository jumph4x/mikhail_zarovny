module ApplicationHelper

  def active type, value
    params[type] == value ? 'active' : ''
  end
  
  def images_path new_h
    h = new_h.reject{|k ,v| v.nil?}

    if h.slice(:subject_matter, :year, :discipline).size == 3
      images_all_path h
    elsif h.slice(:subject_matter, :year).size == 2
      images_smy_path h
    elsif h.slice(:subject_matter).size == 1
      images_sm_path h
    else
      root_path h
    end
  end

  def signature
    seed = (rand(19)+1).to_s
    seed = "0#{seed}" if seed.length == 1
    inline_svg "signature/MZ_signature-#{seed}.svg"
  end

  def inline_svg path
    file = File.open("app/assets/images/#{path}", "rb")
    raw file.read
  end
end
