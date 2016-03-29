require 'csv'

namespace :csv do

  desc 'Import CSV Data'
  task :import_suppliers => :environment do

    csv_file_path = 'db/seed/suppliers_new.csv'

    CSV.foreach(csv_file_path) do |row|
      Supplier.create!({
                        :name => row[1],
                        :address => row[2],
                    })
      puts "#{row[1]} added!"
    end
  end
end