class CsvImporterJob < ApplicationJob
  queue_as :default

  def perform(file)
    CSVImporter.new(file).run
  end
end
