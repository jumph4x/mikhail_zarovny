YEARS = (1980..Time.now.year).to_a.reverse.map{|x| [x, x]}.unshift(['All', nil])
SUBJECT_MATTER = ['Portrait', 'Landscape', 'Mythology', 'Nature Morte'].map{|x| [x, x]}.unshift(['All', nil])
DISCIPLINES = ['Oil painting', 'Acrylic painting', 'Engraving', 'Ink drawing'].map{|x| [x, x]}.unshift(['All', nil])
