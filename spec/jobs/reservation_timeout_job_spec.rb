require "rails_helper"
require 'spec_helper'

RSpec.describe 'ReservationTimeout', :type => :job do
  describe "#perform_later" do
    it "destroys reservation at offline ticket desk after 10 minutes unless paid" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        ReservationTimeoutJob.perform_later('reservation')
      }.to have_enqueued_job
    end
  end
end