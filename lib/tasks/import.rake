desc "import all video data"
task :import => :environment do
  Screencast.all.each do |sc|
    Video.create(sc)
  end
end