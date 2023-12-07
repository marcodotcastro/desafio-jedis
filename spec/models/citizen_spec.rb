# == Schema Information
#
# Table name: citizens
#
#  id         :bigint           not null, primary key
#  full_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Citizen, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:full_name) }
  end
end
