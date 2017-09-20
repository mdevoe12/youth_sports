require 'rails_helper'

RSpec.describe CSVImporter, type: :model do
  it "initializes with file" do
    file = 'spec/features/upload_files/good_data.csv'

    importer = CSVImporter.new("sample")

    expect(importer.file).to eq("sample")
  end

  it "imports a file with the run method" do

  end
end
