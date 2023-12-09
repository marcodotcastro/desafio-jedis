require 'rails_helper'

RSpec.describe 'Api::Sms::Twilio' do
  describe 'send' do
    it 'queued' do
      expect(Api::Sms::Twilio.new.send('+556199998888',
                                       'Ola')).to eq('not_twilio_account')
    end
  end
end
