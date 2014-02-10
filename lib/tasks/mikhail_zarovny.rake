namespace :mz do
  desc 'Clear all ART' 
  task :clear => :environment do
    Image.destroy_all
  end 

  desc 'Importing ART structured in folders' 
  task :import_art => :environment do
    bi = MikhailZarovny::BatchImporter.new
    bi.process!
  end 
end
