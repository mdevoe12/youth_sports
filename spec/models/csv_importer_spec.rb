require 'rails_helper'

RSpec.describe CSVImporter, type: :model do
  it "initializes with file" do
    importer = CSVImporter.new("sample")

    expect(importer.file).to eq("sample")
  end

end
