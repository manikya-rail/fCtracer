# Farms
farms = [
  { name: 'Royal Dairy', city: 'Grant County', state: 'WA' },
  { name: 'Royal Ranch', city: 'Grant County', state: 'WA' },
  { name: 'Abe\'s Kosher Meats', city: 'Burley', state: 'ID' }
]
farms.each do |farm|
  Farm.find_or_create_by(name: farm[:name]) do |new_farm|
    new_farm.city = farm[:city]
    new_farm.state = farm[:state]
  end
end

# Fetch Bovisync Animals
# This will take a while
bovisync = Bovisync.new
offset = 0
animals = bovisync.animal_list(offset: offset)
while animals.present?
  animals.each do |animal|
    Animal.find_or_create_by(bovisync_id: animal[:id]) do |a|
      a.eartag = animal[:eartag]
    end
  end

  animals = bovisync.animal_list(offset: offset)
  offset += 1000
end
