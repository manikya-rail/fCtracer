namespace :animals do
  desc "Syncs animals"
  task :sync => :environment do
    bovisync = Bovisync.new
    since = 26.hours.ago.to_i
    offset = 0
    animals = bovisync.animal_list(offset: offset, since: since)
    while animals.present?
      animals.each do |animal|
        Animal.find_or_create_by(bovisync_id: animal[:id]) do |a|
          a.eartag = animal[:eartag]
        end
      end

      animals = bovisync.animal_list(offset: offset, since: since)
      offset += 1000
    end
  end
end
