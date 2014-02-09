YEARS = (1980..Time.now.year).to_a.reverse
YEARS_FILTER = YEARS.map{|x| [x, x]}.unshift(['All', nil])

SUBJECT_MATTER = ['Portrait', 'Landscape', 'Mythology', 'Nature Morte']
SUBJECT_MATTER_FILTER = SUBJECT_MATTER.map{|x| [x, x]}.unshift(['All', nil])

DISCIPLINES = ['Oil painting', 'Acrylic painting', 'Engraving', 'Ink drawing']
DISCIPLINES_FILTER = DISCIPLINES.map{|x| [x, x]}.unshift(['All', nil])
