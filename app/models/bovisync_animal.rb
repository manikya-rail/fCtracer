# frozen_string_literal: true

class BovisyncAnimal
  include ActiveModel::Model

  attr_accessor :id,
                :agday, # Age
                :bdate, # Birthdate
                :sireshortnam, # Sire
                :locat, # Location
                :owner, # Owner
                :allfarmslife, # All farms the animal has been to. Comma separated
                :solddied, # Whether the animal was sold or died
                :solddate, # When the animal was sold or died,
                :other2id,
                :apiid, 
                :inherd

  ##
  # Returns the birthdate in Month, Year format
  #
  def birth_date
    bdate && DateTime.parse(bdate).strftime('%B %Y')
  end

  ##
  # Returns the name for the Sire
  #
  def sire_name
    sireshortnam&.titleize
  end

  def total
    corn + byproducts + minerals + forages + milk_lbs
  end

  def corn
    calves_corn + grower_corn + beef_corn
  end

  def calves_corn
    165 * 0.1
  end

  def grower_corn
    225 * 4.4
  end

  def beef_corn
    (agday - 390) * 2.6
  end

  def byproducts
    calf_byproducts + grower_byproducts + beef_byproducts
  end

  def calf_byproducts
    165 * 0.4
  end

  def grower_byproducts
    225 * 1.4
  end

  def beef_byproducts
    agday - 390
  end

  def minerals
    calf_minerals + grower_minerals + beef_minerals
  end

  def calf_minerals
    165 * 3.1
  end

  def grower_minerals
    225 * 2.7
  end

  def beef_minerals
    (agday - 390) * 2.9
  end

  def forages
    calf_forages + grower_forages + beef_forages
  end

  def calf_forages
    165 * 1.8
  end

  def grower_forages
    225 * 11.5
  end

  def beef_forages
    (agday - 390) * 11.5
  end

  ##
  # Milk is in gallons so we convert to lbs here
  #
  def milk_gallons
    165 * 0.7
  end

  def milk_lbs
    gallon_in_pounds = 8.6
    milk_gallons * gallon_in_pounds
  end

  ##
  # Returns an array of all the Farms the animal lived at
  #
  def farms
    farm_names = allfarmslife.split(',').map(&:strip).collect { |farm| farm == 'Royal Feed Lot' ? 'Royal Ranch' : farm }
    farm_names.map do |name|
      Farm.find_or_create_by(name: name)
    end
  end

  def birth_farm
    farm = farms.first
    return farm unless farm.name == 'Royal Dairy'

    Farm.find_or_create_by(name: 'Royal Ranch')
  end

  def death_farm
    farms.last
  end

  def conversion_farm
    Farm.find_or_create_by(name: "Abe's Kosher Meats") do |farm|
      farm.city = 'Burley'
      farm.state = 'ID'
    end
  end

  def dead?
    solddied == 1
  end

  def sold?
    solddied == 0
  end

  def death_date
    solddate && DateTime.parse(solddate).strftime('%B %Y')
  end

  def Co2Emitted 
      agday*0.00370583

  end
  def Co2Sequested
    agday*0.004010244
  end
  def Co2Total
    (agday*0.00370583)-(agday*0.004010244)
  end
  ##
  # Beef grade is stored under +other2id+
  #
  def grade
    other2id
  end
end
