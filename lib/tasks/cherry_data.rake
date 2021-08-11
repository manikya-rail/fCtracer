require 'roo'

namespace :cherry_data do
  desc "Import the data from xlsx sheet in cherries table."

  task import: :environment do
    puts 'Importing Data'
    data = Roo::Spreadsheet.open('lib/tasks/cherries_sheet.xlsx')
    headers = data.row(2)

    data.each_with_index do |row, idx|
      next if idx == 0 || idx == 1
      cherry_data = Hash[[headers, row].transpose]
      puts cherry_data
      if Cherry.exists?(location: cherry_data['label'])
        puts "Cherry with lablel #{cherry_data['label']} already exists"
        next
      end
      cherry = Cherry.new(cherry_data)
      cherry.save!
    end
  end
end
