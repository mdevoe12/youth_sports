require 'rails_helper'

RSpec.describe CsvImporterJob, type: :job do

  it "uploads a file" do
    ActiveJob::Base.queue_adapter = :test

    expect {CsvImporterJob.perform_later('file')
    }.to have_enqueued_job
  end
end
