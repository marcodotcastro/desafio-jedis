require 'rails_helper'

RSpec.describe Senders::Registered do
  before do
    Sidekiq::Testing.inline!
  end

  describe 'registered' do
    it 'email' do
      expect { create(:citizen) }.to change {
                                       ActionMailer::Base.deliveries.size
                                     }.by(1)
    end
  end
end
