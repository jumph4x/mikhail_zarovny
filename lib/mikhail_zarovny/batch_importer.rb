module MikhailZarovny
  class BatchImporter
    def art_files
      Dir.glob("#{root_folder}**/*.{#{extensions}}")
    end

    def extensions
      "jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG"
    end

    def root_folder
      "#{Rails.root}/art/"
    end

    def junk_vocabulary
      ['IMG', 'Untitled']
    end

    def sanitized_filename string
      string.
        gsub(/#{extensions.split(',').map{|e| ".#{e}" }.join('|')}/, '').
        gsub(/#{junk_vocabulary.join('|')}/, '').
        gsub(/_|\-/,' ')
    end

    def parse_taxonomy file
      location = file.gsub(root_folder,'')
      *folders, filename = location.split('/')
      {
        :discipline => folders[0],
        :subject_matter => folders[1],
        :year => folders[2],
        :title => sanitized_filename(filename)
      }
    end

    def validated_taxonomy file
      hash = parse_taxonomy file

      [:discipline, :subject_matter, :year].each do |typ|
        values = typ.to_s.upcase.constantize
        next if values.include? hash[typ]
        raise "Cannot import! :#{typ} has an invalid value, valid entries are: #{values}"
      end

      hash
    end

    def process!
      progress = ProgressBar.new("import", art_files.size)

      art_files.each do |f|
        image = Image.new(validated_taxonomy f)
        image.upload = File.open(f)
        progress.inc
        image.save!
      end

      puts ''
      puts 'Import complete.'
    end
  end
end
