require 'rails_helper'

RSpec.describe SendEmailJob, type: :job do
  it "sends an email" do
    ActiveJob::Base.queue_adapter = :test

    expect {SendEmailJob.perform_later
    }.to have_enqueued_job
  end
end
