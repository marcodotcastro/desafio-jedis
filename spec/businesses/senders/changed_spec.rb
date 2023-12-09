require 'rails_helper'

RSpec.describe Senders::Changed do
  before do
    Sidekiq::Testing.inline!
  end

  describe 'changed' do
    let(:citizen) { create(:citizen) }

    context 'email' do
      it 'citizen' do
        expect { citizen.update(full_name: "Gessica Dutra") }.to change { ActionMailer::Base.deliveries.size }.by(2)
      end
    end
  end

end
